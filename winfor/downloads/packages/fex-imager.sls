# Name: FEX Imager
# Website: https://getdataforensics.com
# Description: Physical and Logical Imaging Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 2.2.1.306
# Notes: 

{% set version = '2.2.1.306' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('fex-imager') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-imager\fex-imager-{{ version }}.exe'
    - source: https://download.getdata.com/support/fex/fi/FEX-Imager-(v{{ version }}).exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

