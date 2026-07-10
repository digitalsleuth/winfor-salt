# Name: vssmount
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Windows Batch script to work with and mount Volume Shadow Copies
# Category: Windows Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 3.0
# Notes: 

{% set version = '3.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '497720e708a0e203069042af85cb2b23989c5271ef6e40e180b82ae9b7385f9d' %}

vssmount-download-only:
  file.managed:
    - name: '{{ downloads }}\vssmount\vssmount-{{ version }}.cmd'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/vssmount.cmd
    - source_hash: sha256={{ hash }}
    - makedirs: True
