# Name: FEX Imager
# Website: https://getdataforensics.com
# Description: Physical and Logical Imaging Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 2.2.1.306
# Notes: 

{% set version = '2.2.1.306' %}
{% set hash = '98a5d621ef70bbdf6948b7e281abd3c5cdb35ff81b2a379f731d8e832f3c8529' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-imager\FEX-Imager-(v{{ version }}).exe'
    - source: https://download.getdata.com/support/fex/fi/FEX-Imager-(v{{ version }}).exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

