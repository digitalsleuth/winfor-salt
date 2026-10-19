# Name: FEX Memory Imager
# Website: https://getdataforensics.com
# Description: Memory Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.21
# Notes: 

{% set version = '1.21' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('fex-memory-imager') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

fex-memory-imager-download:
  file.managed:
    - name: 'C:\salt\tempdownload\FEX-Memory-(v{{ version }}).zip'
    - source: https://download.getdata.com/support/fex/memory/FEX-Memory-(v{{ version }}).zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

fex-memory-imager-extract:
  archive.extracted:
    - name: '{{ inpath }}\fex-memory-imager'
    - source: 'C:\salt\tempdownload\FEX-Memory-(v{{ version }}).zip'
    - enforce_toplevel: False
    - require:
      - file: fex-memory-imager-download
