# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 4.0.167.1391
# Notes: The file for version 4.0.167.1391 is actually named 4.0.167.1390

{% set version = '4.0.167.1390' %}
{% set hash = '0c87e1c3cfd958019a79ae0e48f265e57f19e51ed3ffb0e93f2e58f94582e3ec' %}
{% set folder_hash = 'c3b902e471a2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fec-download-only:
  file.managed:
    - name: '{{ downloads }}\fec\FECSetup_v{{ version }}.msi'
    - source: https://storage.googleapis.com/fec-downloads/FEC/{{ version }}_{{ folder_hash }}/FECSetup_v{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
