# Name: vssmount
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Windows Batch script to work with and mount Volume Shadow Copies
# Category: Windows Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 2.0
# Notes: 

{% set version = '2.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

vssmount-offline:
  file.managed:
    - name: '{{ inpath }}\vssmount\vssmount.cmd'
    - source: '{{ downloads }}\vssmount\vssmount-{{ version }}.cmd'
    - makedirs: True

vssmount-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\vssmount'
