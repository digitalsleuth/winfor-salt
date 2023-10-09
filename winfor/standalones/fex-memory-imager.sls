# Name: FEX Memory Imager
# Website: https://getdataforensics.com
# Description: Memory Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.10
# Notes: 

{% set version = '1.10' %}
{% set hash = '38ca0ac1fa076d298d6bb8e55c954e6e945c438d38b618dbc97c12d6157459a3' %}
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
