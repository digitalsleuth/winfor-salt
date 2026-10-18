#!/usr/bin/env python3

import argparse
import re
import sys
from pathlib import Path

CATEGORIES = ("installers", "packages", "python3-tools", "standalones")
PREFIXES = ("", "downloads", "offline")
HEADER_RE = re.compile(r"^(# Version:[ \t]*)([^\r\n]*?)([ \t]*)(?=\r?$)", re.M)
SHA256_RE = re.compile(r"[0-9A-Fa-f]{64}")
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
EXTRA_HASHES = (
    "nmap",
    "android-studio",
    "dotnet6-desktop-runtime",
    "fec",
    "reko",
    "apktool",
    "memprocfs-analyzer",
)


def var_re(var: str) -> re.Pattern:
    return re.compile(
        rf"^(\s*\{{%-?\s*set\s+{re.escape(var)}\s*=\s*)(['\"])([^'\"]*)\2(\s*-?%\}})",
        re.M,
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
        new_text = HEADER_RE.sub(
            lambda m: m.group(1) + header_version + m.group(3), text
        )
        if new_text != text:
            changes.append("# Version")
        text = new_text

    for var, value in sets.items():
        regex = var_re(var)
        new_text = regex.sub(
            lambda m: m.group(1) + m.group(2) + value + m.group(2) + m.group(4), text
        )
        if new_text != text:
            changes.append(var)
        elif var == "version" and not regex.search(text):
            changes.append("NOTE: no 'set version' line")
        text = new_text
    return text, changes


def main() -> int:
    parser = argparse.ArgumentParser(description="WinFOR state updater")
    parser.add_argument("name", help="state file name without .sls")
    parser.add_argument("--version")
    parser.add_argument("--hash", dest="hash_")
    for opt in EXTRA_VARS:
        parser.add_argument(f"--{opt}", help="x-ways only")
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parent / "winfor",
        help="path to the root folder (default: next to this script)",
    )
    parser.add_argument("-n", "--dry-run", action="store_true")
    args = parser.parse_args()

    extras = {
        var: getattr(args, opt)
        for opt, (var, _) in EXTRA_VARS.items()
        if getattr(args, opt) is not None
    }
    if args.version is None and args.hash_ is None and not extras:
        parser.error("nothing to update: pass --version, --hash or an x-ways option")
    hashes = {"--hash": args.hash_}
    hashes.update(
        {
            f"--{o}": getattr(args, o)
            for o, (_, is_hash) in EXTRA_VARS.items()
            if is_hash
        }
    )
    for opt, value in hashes.items():
        if value is not None and not SHA256_RE.fullmatch(value):
            parser.error(f"{opt} must be a 64-character hex SHA256")

    special = SPECIAL.get(args.name, {})
    files = find_files(args.root, args.name)
    if not files:
        print(
            f"No state files named {args.name}.sls found under {args.root}",
            file=sys.stderr,
        )
        return 1
    if args.name in EXTRA_HASHES:
        print(
            f"The state file {args.name} has other hashes to update as well. Make sure you check these!"
        )
    for path in files:
        rel = path.relative_to(args.root).as_posix()
        sets = {}
        if args.version is not None:
            sets["version"] = args.version
        if args.hash_ is not None:
            sets[special.get("hash_var", "hash")] = args.hash_
        sets.update(extras)
        text = path.read_bytes().decode("utf-8")
        new_text, changes = update_text(text, args.version, sets)
        if new_text == text:
            print(
                f"unchanged  {rel}  ({', '.join(changes)})"
                if changes
                else f"unchanged  {rel}"
            )
            continue
        if not args.dry_run:
            path.write_bytes(new_text.encode("utf-8"))
        print(
            f"{'would update' if args.dry_run else 'updated'}  {rel}  ({', '.join(changes)})"
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
