# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.2.11
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set short = '5.2' %}
{% set version = '5.2.11' %}
{% set date = '20221218' %}
{% set hash = '9FAF517784E6D2BD1B6879A8FE2197318F423A24FF47AD64BBB6295A78C79AE6' %}

memprocfs-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v{{ short }}/MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

memprocfs-unzip:
  archive.extracted:
    - name: '{{ inpath }}\memprocfs\'
    - source: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-download

memprocfs-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\memprocfs\'
