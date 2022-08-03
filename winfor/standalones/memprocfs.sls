# Name: MemProcFS
# Website: https://github.com/ufrisk/MemProcFS
# Description: Memory Process File System
# Category: Raw Parsers / Decoders
# Author: Ulf Frisk
# License: GNU Affero GPL v3.0 - https://github.com/ufrisk/MemProcFS/blob/master/LICENSE
# Version: 4.9.3
# Notes: 

{% set version = '4.9.3' %}
{% set hash = 'ea2a343fc2d65b59eaff2f2387cb4646d9ac25f8b5d601438f570f4884cc19eb' %}

memprocfs-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-20220718.zip'
    - source: https://github.com/ufrisk/MemProcFS/releases/download/v4.9/MemProcFS_files_and_binaries_v{{ version }}-win_x64-20220718.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

memprocfs-unzip:
  archive.extracted:
    - name: 'C:\standalone\memprocfs\'
    - source: 'C:\salt\tempdownload\MemProcFS_files_and_binaries_v{{ version }}-win_x64-20220718.zip'
    - enforce_toplevel: False
    - require:
      - file: memprocfs-download

memprocfs-env-vars:
  win_path.exists:
    - name: 'C:\standalone\memprocfs\'
