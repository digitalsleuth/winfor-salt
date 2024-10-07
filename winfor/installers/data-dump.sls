# Name: Data Dump
# Website: https://www.digital-detective.net/datadump/
# Description: Tool to extract segments of data from an image or device
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 2.3.24262.11
# Notes: x86

{% set version = '2.3.24262.11' %}
{% set hash = '5a6ce7be7ed6bb38db624df3b2c7e029755ddc9a7176aa4ae1220dbcaaf0693c' %}

data-dump:
  file.managed:
    - name: 'C:\salt\tempdownload\DataDump-x86-EN-{{ version }}.zip'
    - source: https://www.digital-detective.net/download/download.php?downcode=nm3hquyi30jq1ea2gr8p
    - source_hash: sha256={{ hash }}
    - makedirs: True

data-dump-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\data-dump'
    - source: 'C:\salt\tempdownload\DataDump-x86-EN-{{ version }}.zip'
    - enforce_toplevel: False
    - watch:
      - file: data-dump

data-dump-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\data-dump\DataDump-x86-EN-{{ version }}.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH,!DESKTOPICON'
    - require:
      - file: data-dump
      - archive: data-dump-extract
