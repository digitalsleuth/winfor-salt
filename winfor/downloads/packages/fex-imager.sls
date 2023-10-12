# Name: FEX Imager
# Website: https://getdataforensics.com
# Description: Physical and Logical Imaging Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 2.2.1.283
# Notes: 

{% set version = '2.2.1.283' %}
{% set hash = '60085629eac79b9838e0d5620aa23b4a3205dff23eaf1e552cdb7e7fe1b541d6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-imager\FEX-Imager-(v{{ version }}).exe'
    - source: https://download.getdata.com/support/fex/fi/FEX-Imager-(v{{ version }}).exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

