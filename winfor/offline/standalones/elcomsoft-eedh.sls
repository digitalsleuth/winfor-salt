# Name: Elcomsoft Encrypted Disk Hunter
# Website: https://blog.elcomsoft.com/2020/07/live-system-analysis-discovering-encrypted-disk-volumes/
# Description: Tool to identify encrypted disks on Windows computers
# Category: Utilities
# Author: Elcomsoft
# License: Proprietary License (https://www.elcomsoft.com/help/Elcomsoft_EULA_free_en.pdf)
# Version: 1.10
# Notes:

{% set version = '1.10' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

elcomsoft-eedh-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\elcomsoft-eedh'
    - source: '{{ downloads }}\elcomsoft-eedh\eedh-{{ version }}.zip'
    - enforce_toplevel: False
