# Name: FEX Imager
# Website: https://getdataforensics.com
# Description: Physical and Logical Imaging Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 2.2.1.304
# Notes: 

{% set version = '2.2.1.304' %}
{% set hash = '2ad302fb3c5db369da41573bf7cbc436121381f4c20ff6ce025ee96223a853e4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-imager\FEX-Imager-(v{{ version }}).exe'
    - source: https://download.getdata.com/support/fex/fi/FEX-Imager-(v{{ version }}).exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

