# Name: FEX Memory Imager
# Website: https://getdataforensics.com
# Description: Memory Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.21
# Notes: 

{% set version = '1.21' %}
{% set hash = 'd395c632070ddcd75d884a3d081d7169712d526e36f4a63705d4ed41c5afc6b1' %}
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
