# Name: Backup2FS
# Website: https://elusivedata.io/
# Description: Apple iOS backup viewer
# Category: Mobile Analysis
# Author: James Eichbaum
# License: Copyright (https://github.com/eichbaumj/Backup2FS#license)
# Version: 3.0.0
# Notes:

{% set version = '3.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %} 
{% set hash = '3894bdade7341b2dd1581d12502d7b325c9b0e5a82b763fa26e5b3b8e650c974' %}

backup2fs-download-only:
  file.managed:
    - name: '{{ downloads }}\backup2fs\backup2fs-{{ version }}.exe'
    - source: https://github.com/eichbaumj/Backup2FS/releases/download/v{{ version }}/Backup2FS_Setup_{{ version }}_x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
