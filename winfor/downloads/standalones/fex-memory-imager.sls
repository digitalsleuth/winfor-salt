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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-memory-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-memory-imager\FEX-Memory-(v{{ version }}).zip'
    - source: https://download.getdata.com/support/fex/memory/FEX-Memory-(v{{ version }}).zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
