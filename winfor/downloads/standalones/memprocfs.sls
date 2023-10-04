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
{% set hash = '3139be170530c7282c294c1773d41365cc60bfbebebc8d8af632c5b1ee55916b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

memprocfs-download-only:
  file.managed:
    - name: '{{ downloads }}\MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v{{ short }}/MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
