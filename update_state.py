#!/usr/bin/env python3

import argparse
import re
import sys
from pathlib import Path

CATEGORIES = ("installers", "packages", "python3-tools", "standalones")
PREFIXES = ("", "downloads", "offline")
CENTRAL = Path("_macros") / "hashes.jinja"

HEADER_RE = re.compile(r"^(# Version:[ \t]*)([^\r\n]*?)([ \t]*)(?=\r?$)", re.M)
SHA = r"[0-9A-Fa-f]{64}"
SHA256_RE = re.compile(SHA)
EXTRA_VARS = {
    "xviewerhash": ("xviewerhash", True),
    "xviewer_ver": ("xviewer_ver", False),
    "mplayerhash": ("mplayerhash", True),
    "tesseracthash": ("tesseracthash", True),
    "manualhash": ("manualhash", True),
}
SPECIAL = {
    "x-ways": {"hash_var": "xwhash"},
}


def var_re(var: str) -> re.Pattern:
    return re.compile(
        rf"^(\s*\{{%-?\s*set\s+{re.escape(var)}\s*=\s*)(['\"])([^'\"]*)\2(\s*-?%\}})", re.M
    )


def find_files(winfor: Path, name: str) -> list[Path]:
    found = []
    for prefix in PREFIXES:
        for category in CATEGORIES:
            path = winfor / prefix / category / f"{name}.sls"
            if path.is_file():
                found.append(path)
    return found


def update_text(text: str, header_version: str | None, sets: dict[str, str]):
    changes = []

    if header_version is not None:
        new_text = HEADER_RE.sub(lambda m: m.group(1) + header_version + m.group(3), text)
        if new_text != text:
            changes.append("# Version")
        text = new_text

    for var, value in sets.items():
        regex = var_re(var)
        new_text = regex.sub(lambda m: m.group(1) + m.group(2) + value + m.group(2) + m.group(4),
                             text)
        if new_text != text:
            changes.append(var)
        elif var == "version" and not regex.search(text):
            changes.append("NOTE: no literal 'set version' line")
        text = new_text
    return text, changes


def update_central(text: str, name: str, new: dict[str, str]):
    m = re.search(rf"^(  '{re.escape(name)}': )(.*?)(,)[ \t]*$", text, re.M)
    if not m:
        return None
    value, changed, handled = m.group(2), [], []
    if value.startswith("'"):
        if "hash" in new:
            handled.append("hash")
            if value.strip("'") != new["hash"]:
                value, changed = f"'{new['hash']}'", ["hash"]
    else:
        for var, new_value in new.items():
            hm = re.search(rf"'{re.escape(var)}': '([^']*)'", value)
            if not hm:
                continue
            handled.append(var)
            if hm.group(1) != new_value:
                value = value[:hm.start(1)] + new_value + value[hm.end(1):]
                changed.append(var)
    return text[:m.start(2)] + value + text[m.end(2):], changed, handled


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("name", help="state file name without .sls")
    parser.add_argument("--version")
    parser.add_argument("--hash", dest="hash_")
    parser.add_argument("--set-hash", action="append", metavar="VAR=HEX",
                        help="another named hash")
    parser.add_argument("--set", dest="set_values", action="append", metavar="VAR=VALUE",
                        help="any other value the download needs, e.g. date, guid, commit")
    for opt in EXTRA_VARS:
        parser.add_argument(f"--{opt}", help="x-ways only")
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parent / "winfor",
                        help="path to the winfor folder (default: next to this script)")
    parser.add_argument("-n", "--dry-run", action="store_true")
    args = parser.parse_args()

    special = SPECIAL.get(args.name, {})
    hash_updates = {}
    if args.hash_ is not None:
        hash_updates[special.get("hash_var", "hash")] = args.hash_
    other = {}
    for opt, (var, is_hash) in EXTRA_VARS.items():
        value = getattr(args, opt)
        if value is not None:
            (hash_updates if is_hash else other)[var] = value
    for item in args.set_hash or []:
        var, _, value = item.partition("=")
        if not re.fullmatch(r"\w*hash\w*", var) or not value:
            parser.error(f"--set-hash expects VAR=HEX, got {item!r}")
        hash_updates[var] = value
    for item in args.set_values or []:
        var, _, value = item.partition("=")
        if not re.fullmatch(r"\w+", var) or not value:
            parser.error(f"--set expects VAR=VALUE, got {item!r}")
        other[var] = value
    if args.version is None and not hash_updates and not other:
        parser.error("nothing to update: pass --version, --hash, --set or an x-ways option")
    for var, value in hash_updates.items():
        if not SHA256_RE.fullmatch(value):
            parser.error(f"{var} must be a 64-character hex SHA256")
    for var, value in other.items():
        if re.search(r"""['"\\{}]""", value):
            parser.error(f"{var}: value may not contain quotes, backslashes or braces")
    all_updates = {**hash_updates, **other}

    files = find_files(args.root, args.name)
    if not files:
        print(f"No state files named {args.name}.sls found under {args.root}", file=sys.stderr)
        return 1

    writes, report = [], []
    handled = set()
    verb = "would update" if args.dry_run else "updated"
    central_path = args.root / CENTRAL
    if all_updates and central_path.is_file():
        result = update_central(central_path.read_bytes().decode("utf-8"), args.name, all_updates)
        if result:
            new_central, changed, handled_vars = result
            handled = set(handled_vars)
            if handled:
                report.append(f"{verb if changed else 'unchanged'}  {CENTRAL.as_posix()}  "
                              f"({', '.join(changed) or args.name})")
            if changed:
                writes.append((central_path, new_central.encode("utf-8")))

    texts = {}
    for path in files:
        rel = path.relative_to(args.root).as_posix()
        sets = {}
        if args.version is not None:
            sets["version"] = args.version
        sets.update(hash_updates)
        sets.update(other)
        texts[path] = text = path.read_bytes().decode("utf-8")
        new_text, changes = update_text(text, args.version, sets)
        if new_text == text:
            report.append(f"unchanged  {rel}  ({', '.join(changes)})" if changes else f"unchanged  {rel}")
            continue
        writes.append((path, new_text.encode("utf-8")))
        report.append(f"{verb}  {rel}  ({', '.join(changes)})")

    unapplied = sorted(var for var in all_updates
                       if var not in handled and not any(var_re(var).search(t) for t in texts.values()))
    if unapplied:
        print(f"error: {', '.join(unapplied)} can't be applied to {args.name}: no such key in its hashes.jinja "
              f"entry and no 'set' line in any copy. Nothing was written.", file=sys.stderr)
        return 2

    print("\n".join(report))
    if not args.dry_run:
        for path, data in writes:
            path.write_bytes(data)
    return 0


if __name__ == "__main__":
    sys.exit(main())
