# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.8.17
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set short = '5_archive' %}
{% set version = '5.8.17' %}
{% set date = '20231128' %}
{% set hash = '22196c8fdd09db229ed8ee649e56b406a5f8dd43f7728cfe13cd1618aaef7085' %}

memprocfs-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v{{ short }}/MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip
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

memprocfs-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\memprocfs\'
    - require:
      - archive: memprocfs-extract
      - file: memprocfs-version-file

