# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 5.19.0
# Notes: 

{% set version = '5.19.0' %}
{% set date = '20261014' %}
{% set hash = '5dc42673f35371e309b2c3f5c302556489897451a90905061035b630239d3ca9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

memprocfs-download-only:
  file.managed:
    - name: '{{ downloads }}\memprocfs\memprocfs-{{ version }}.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v5_archive/MemProcFS_files_and_binaries_v{{ version }}-win_x64-{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
