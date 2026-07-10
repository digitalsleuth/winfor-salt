# Name: Magnet DumpIt
# Website: https://www.magnetforensics.com
# Description: Windows Memory Dump tools from Comae / Magnet
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 20250131
# Notes: 

{% set version = '20250131' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'magnet-dumpit-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\magnetforensics\\' + pkg) %}

{% if exists %}

magnet-dumpit-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\magnet\dumpit\'
    - source: '{{ downloads }}\magnetforensics\{{ pkg }}'
    - enforce_toplevel: False

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
