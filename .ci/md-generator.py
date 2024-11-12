#! /usr/bin/env python3
#
# Parse headers of WIN-FOR Salt state files,
# generate a listing of the tools described by the files,
# and create a markdown file to be used to generate a PDF
# using Pandoc
#
# Code partially adapted from Halil Burak Noyan: https://twitter.com/hbnoyan, https://github.com/0xballistics
#
# Modified for WIN-FOR by Corey Forman
# MIT License


import os
import re
import logging
import sys
import json
import argparse
from time import strftime, localtime

header_regex = re.compile(r"#\s*(?P<key>.*?):\s*(?P<value>.*)")
today = strftime("%Y-%m-%d", localtime())
doc_header = f'--- \ntitle: "WIN-FOR Tool List" \nauthor: Corey Forman (digitalsleuth) \ndate: {today} \nmainfont: DejaVuSans \ngeometry: "left=2cm,right=2cm,top=1cm,bottom=2cm" \noutput: pdf_document\n---\n  \n'
taglines = {
    "Acquisition and Analysis": "Tools used for the acquisition and bulk processing / analysis of evidence items",
    "Browsers": "Web browsers",
    "Databases": "Database browsers",
    "Documents / Editors": "Applications to create, modify, disassemble, and analyze document files.",
    "Email": "Analyze email artifacts",
    "Executables": "Reverse engineering, static, and dynamic analysis of executables",
    "Installers": "Decompile and deconstruct installers",
    "Logs": "Event and Web log analysis",
    "Mobile Analysis": "Analysis of mobile devices and applications",
    "Network": "Network traffic analysis tools",
    "Raw Parsers / Decoders": "Basic tools for byte-level analysis of data blobs",
    "Registry": "Analysis of Windows registry artifacts",
    "Requirements": "Applications required to make everything else work",
    "Terminals": "Use of Linux-emulated terminals on Windows",
    "Utilities": "Basic utilities to assist in data analysis or transfer",
    "Windows Analysis": "Tools to conduct forensic analysis on various Windows artifacts",
}


def get_logger():
    return logging.getLogger(__name__)


def find_tools(sls_search_path, skip_dir=None):
    tools = {}
    for root, dirs, files in os.walk(sls_search_path, topdown=False):
        for file_name in files:
            if file_name == "init.sls":
                continue
            if file_name.endswith(".sls"):
                rel_dir = os.path.relpath(root, sls_search_path)
                if skip_dir and skip_dir in rel_dir:
                    continue
                rel_file = os.path.join(rel_dir, file_name)
                try:
                    d = parse_header(sls_search_path, rel_file)
                except KeyError as e:
                    get_logger().error(str(e))
                    continue
                cat = d["category"]
                tools.setdefault(cat, [])
                tools[cat].append(d)

    return tools


def parse_header(base_path, file_name):
    file_path = os.path.join(base_path, file_name)
    fields = []
    name = None
    website = desc = category = author = license = version = notes = ""
    with open(file_path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("{%") or line.startswith("{{"):
                continue
            elif not line.startswith("#"):
                break
            else:
                match = header_regex.match(line)
                if match:
                    key, value = match.group("key"), match.group("value").strip()
                    if key.lower() == "name":
                        name = value
                    elif key.lower() == "website":
                        website = value
                    elif key.lower() == "description":
                        desc = value
                    elif key.lower() == "category":
                        category = value
                    elif key.lower() == "author":
                        author = value
                    elif key.lower() == "license":
                        license = value
                    elif key.lower() == "version":
                        version = value
                    elif key.lower() == "notes":
                        notes = value
                    fields.append((key, value))
                else:
                    get_logger().warning(
                        f"file: {file_path} - line does not match with regex: {line}"
                    )

    if not fields:
        raise KeyError(f"no header: {file_path}")
    elif not name:
        raise KeyError(f"found header but no name field: {file_path}")
    elif not category:
        raise KeyError(f"found header but no category: {file_path}")

    if os.name == "posix":
        state_file_path = os.path.splitext(file_name)[0].strip("./").replace("/", ".")
    elif os.name == "nt":
        state_file_path = os.path.splitext(file_name)[0].strip(".\\").replace("\\", ".")

    return {
        "name": name,
        "website": website,
        "desc": desc,
        "category": category,
        "author": author,
        "license": license,
        "version": version,
        "notes": notes,
        "state_file": state_file_path,
    }


def generate_markdown(tool_list, output):
    categories = sorted(tool_list.keys())
    with open(output, "w") as md_file:
        md_file.write(doc_header)
        for category in categories:
            md_file.write(f"# {category}  \n")
            md_file.write(f"{taglines[category]}  \n\n")
            sorted_tools = sorted(tool_list[category], key=lambda x: x["name"].lower())
            for tool in sorted_tools:
                md_file.write(f"## {tool['name']}  \n")
                md_file.write(f"Website: {tool['website']}  \n")
                md_file.write(f"Description: {tool['desc']}  \n")
                md_file.write(f"Author: {tool['author']}  \n")
                md_file.write(f"License: {tool['license']}  \n")
                md_file.write(f"Version: {tool['version']}  \n")
                md_file.write(f"Notes: {tool['notes']}  \n")
                md_file.write("  \n")
    md_file.close()


def main():
    parser = argparse.ArgumentParser(
        description="Parse Salt State headers for local documentation"
    )
    parser.add_argument("-d", "--dir", help="Path to the Salt State directory")
    parser.add_argument(
        "-o",
        "--output",
        help="Path to store the markdown output, including file name and ext.",
    )
    parser.add_argument(
        "-s", "--skip", help="Path to skip while searching for headers", default=None
    )
    args = parser.parse_args()

    if len(sys.argv[:1]) == 0:
        parser.print_help()
        parser.exit()

    tool_list = find_tools(args.dir, args.skip)
    generate_markdown(tool_list, args.output)


if __name__ == "__main__":
    main()
