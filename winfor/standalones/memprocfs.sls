# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.17.3
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '5.17.3' %}
{% set date = '20260312' %}
{% set hash = 'fcbdda3e29d1e9c109fba35cce37711ebee0184fcd2e66a9d6416cab1b893704' %}

include:
  - winfor.config.shims

memprocfs-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v5_archive/MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

memprocfs-extract:
  archive.extracted:
    - name: '{{ inpath }}\memprocfs\'
    - source: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-download

memprocfs-version-file:
  file.managed:
    - name: '{{ inpath }}\memprocfs\Version.txt'
    - contents:
      - {{ version }}
    - require:
      - archive: memprocfs-extract

memprocfs-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\memprocfs\MemProcFs.exe -OutPath {{ inpath }}\shims\memprocfs.exe'
    - require:
      - sls: winfor.config.shims
      - archive: memprocfs-extract
      - file: memprocfs-version-file

