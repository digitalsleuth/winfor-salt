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

fex-memory-imager-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\fex-memory-imager\FEX-Memory-(v{{ version }}).zip'
    - enforce_toplevel: False

fex-memory-imager-rename-offline:
  file.rename:
    - name: '{{ inpath }}\fex-memory-imager'
    - source: '{{ inpath }}\FEX-Memory-(v{{ version }})'
    - force: True
    - makedirs: True
    - require:
      - archive: fex-memory-imager-extract-offline
