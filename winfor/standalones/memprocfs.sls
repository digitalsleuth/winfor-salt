# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.2.3
# Notes: 

{% set short = '5.2' %}
{% set version = '5.2.3' %}
{% set date = '20221204' %}
{% set hash = 'BD19BD14FCC1DDCC5C1434D9B16D4D1A15ED2645ADA13A41388BD038B6C3254A' %}

memprocfs-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v{{ short }}/MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

memprocfs-unzip:
  archive.extracted:
    - name: 'C:\standalone\memprocfs\'
    - source: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-download

memprocfs-env-vars:
  win_path.exists:
    - name: 'C:\standalone\memprocfs\'
