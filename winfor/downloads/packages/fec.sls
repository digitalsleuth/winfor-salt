# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 4.0.200.1093
# Notes:

{% set version = '4.0.200.1093' %}
{% set hash = '33dcc158d713a2c83aa56efebc99a4fcc45969fc55f1f6cd58b90b8b3be3e18c' %}
{% set folder_hash = '309b4e16a2e5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fec-download-only:
  file.managed:
    - name: '{{ downloads }}\fec\FECSetup_v{{ version }}.msi'
    - source: https://storage.googleapis.com/fec-downloads/FEC/{{ version }}_{{ folder_hash }}/FECSetup_v{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
