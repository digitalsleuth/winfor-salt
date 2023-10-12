# Name: vssmount
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Windows Batch script to work with and mount Volume Shadow Copies
# Category: Windows Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 2.0
# Notes: 

{% set hash = 'a9fde04ce05e1f53ecc4464126a102ca8283b04039dee320b6c3f15001938933' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.0' %}

vssmount-download-only:
  file.managed:
    - name: '{{ downloads }}\vssmount\vssmount-{{ version }}.cmd'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/vssmount.cmd
    - source_hash: sha256={{ hash }}
    - makedirs: True
