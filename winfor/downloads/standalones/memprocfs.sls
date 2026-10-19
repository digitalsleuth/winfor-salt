# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.19.0
# Notes: 

{% set version = '5.19.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set date = get_hash('memprocfs', 'date') %}
{% set hash = get_hash('memprocfs') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

memprocfs-download-only:
  file.managed:
    - name: '{{ downloads }}\memprocfs\memprocfs-{{ version }}.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v5_archive/MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
