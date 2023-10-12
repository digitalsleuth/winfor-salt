# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.8.7
# Notes: 

{% set short = '5_archive' %}
{% set version = '5.8.7' %}
{% set date = '20230930' %}
{% set hash = '13bd3bdb4840fe109c04db3b80e6bded97b18915f30290588713b2d57adbf61c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

memprocfs-download-only:
  file.managed:
    - name: '{{ downloads }}\memprocfs\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v{{ short }}/MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
