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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-memory-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-memory-imager\fex-memory-imager-{{ version }}.zip'
    - source: https://download.getdata.com/support/fex/memory/FEX-Memory-(v{{ version }}).zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
