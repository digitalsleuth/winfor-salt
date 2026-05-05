# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.17.6
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '5.17.6' %}
{% set date = '20260426' %}
{% set hash = '54c768ce9eb52eb52aa072733d4b82b51e42a85436b9e52672b8cb4438a2766a' %}

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

