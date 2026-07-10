# Name: CAINE (Computer Aided INvestigative Environment)
# Website: https://www.caine-live.net/
# Description: USB bootable forensic environment
# Category: Utilities
# Author: Nanni Bassetti (https://www.caine-live.net/page4/page4.html)
# License: GNU General Public License v2.1+ (https://www.caine-live.net/)
# Version: 14.0
# Notes: 

{% set version = '14.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'caine-'~ version ~'.iso' %}
{% set exists = salt['file.file_exists'](downloads + '\\caine\\' + pkg) %}

{% if exists %}

caine-iso-offline:
  file.rename:
    - name: '{{ inpath }}\caine\{{ pkg }}'
    - source: '{{ downloads }}\caine\{{ pkg }}'
    - force: True
    - makedirs: True

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
