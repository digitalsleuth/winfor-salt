# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 4.1.547.120
# Notes:

{% set version = '4.1.547.120' %}
{% set hash = '1309f5fbc31971108486e966c7dd49d8adc9681e5df24d68edb184e8616f4f94' %}
{% set folder_hash = 'aead6e23bf58' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fec-download-only:
  file.managed:
    - name: '{{ downloads }}\fec\FECSetup_v{{ version }}.msi'
    - source: https://storage.googleapis.com/fec-downloads/FEC/{{ version }}_{{ folder_hash }}/FECSetup_v{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
