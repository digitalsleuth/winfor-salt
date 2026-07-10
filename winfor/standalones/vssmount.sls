# Name: vssmount
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Windows Batch script to work with and mount Volume Shadow Copies
# Category: Windows Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 3.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '497720e708a0e203069042af85cb2b23989c5271ef6e40e180b82ae9b7385f9d' %}

vssmount-download:
  file.managed:
    - name: '{{ inpath }}\vssmount.cmd'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/vssmount.cmd
    - source_hash: sha256={{ hash }}
    - makedirs: True
