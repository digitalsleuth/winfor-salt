# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 3.88.0.15
# Notes:

{% set version = '3.88.0.15' %}
{% set hash = '1b127c537647fcfb71a87288c0978407a677c93804e55b8405ba3c0ddda23ffc' %}
{% set folder_hash = '16be92bc7305' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fec-download-only:
  file.managed:
    - name: '{{ downloads }}\fec\FECSetup_v{{ version }}.msi'
    - source: https://storage.googleapis.com/fec-downloads/FEC/{{ version }}_{{ folder_hash }}/FECSetup_v{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
