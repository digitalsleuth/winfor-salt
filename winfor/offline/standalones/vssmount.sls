# Name: vssmount
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Windows Batch script to work with and mount Volume Shadow Copies
# Category: Windows Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 3.0
# Notes: 

{% set version = '3.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'vssmount-'~ version ~'.cmd' %}
{% set exists = salt['file.file_exists'](downloads + '\\vssmount\\' + pkg) %}

{% if exists %}

vssmount-offline:
  file.managed:
    - name: '{{ inpath }}\vssmount\vssmount.cmd'
    - source: '{{ downloads }}\vssmount\vssmount-{{ version }}.cmd'
    - makedirs: True

vssmount-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\vssmount'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
