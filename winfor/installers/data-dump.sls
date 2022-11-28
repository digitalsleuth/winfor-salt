# Name: Data Dump
# Website: https://www.digital-detective.net/datadump/
# Description: Tool to extract segments of data from an image or device
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 2.0.22328.16
# Notes: x86

{% set version = '2.0.22328.16' %}
{% set hash = '76336f15ec079d4cb0d0b70bef469c5dd07c140371767e6c85394754873339d3' %}

data-dump:
  file.managed:
    - name: C:\\salt\\tempdownload\\DataDump-x86-EN-{{ version }}.zip
    - source: https://www.digital-detective.net/download/download.php?downcode=w1qsj6b3ru92d4xwm72z
    - source_hash: sha256={{ hash }}
    - makedirs: True

data-dump-extract:
  archive.extracted:
    - name: C:\\salt\\tempdownload\\data-dump
    - source: C:\\salt\\tempdownload\\DataDump-x86-EN-{{ version }}.zip
    - enforce_toplevel: False
    - watch:
      - file: data-dump

data-dump-install:
  cmd.run:
    - name: "C:\\salt\\tempdownload\\data-dump\\DataDump-x86-EN-{{ version }}.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH,!DESKTOPICON"
    - require:
      - file: data-dump
      - archive: data-dump-extract
