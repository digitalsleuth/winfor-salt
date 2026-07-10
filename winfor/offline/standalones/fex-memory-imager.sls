# Name: FEX Memory Imager
# Website: https://getdataforensics.com
# Description: Memory Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.21
# Notes: 

{% set version = '1.21' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'fex-memory-imager-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\fex-memory-imager\\' + pkg) %}

{% if exists %}

fex-memory-imager-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\fex-memory-imager\{{ pkg }}'
    - enforce_toplevel: False

fex-memory-imager-rename-offline:
  file.rename:
    - name: '{{ inpath }}\fex-memory-imager'
    - source: '{{ inpath }}\FEX-Memory-(v{{ version }})'
    - force: True
    - makedirs: True
    - require:
      - archive: fex-memory-imager-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}