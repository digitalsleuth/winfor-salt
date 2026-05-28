# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.17.6
# Notes: 

{% set version = '5.17.6' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set date = '20260426' %}

include:
  - winfor.config.shims

memprocfs-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\memprocfs\'
    - source: '{{ downloads }}\memprocfs\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - enforce_toplevel: False

memprocfs-version-file-offline:
  file.managed:
    - name: '{{ inpath }}\memprocfs\Version.txt'
    - contents:
      - {{ version }}
    - require:
      - archive: memprocfs-extract-offline

memprocfs-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\memprocfs\MemProcFs.exe -OutPath {{ inpath }}\shims\memprocfs.exe'
    - require:
      - sls: winfor.config.shims
      - archive: memprocfs-extract-offline
      - file: memprocfs-version-file-offline
