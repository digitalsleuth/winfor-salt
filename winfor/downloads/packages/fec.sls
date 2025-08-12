# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 4.1.525.75
# Notes:

{% set version = '4.1.525.75' %}
{% set hash = '1863d0f95b9e0a6de322ef9dd0052c3e7cc442d2f00dba89ab019e1b93088166' %}
{% set folder_hash = '47c62775a4d9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fec-download-only:
  file.managed:
    - name: '{{ downloads }}\fec\FECSetup_v{{ version }}.msi'
    - source: https://storage.googleapis.com/fec-downloads/FEC/{{ version }}_{{ folder_hash }}/FECSetup_v{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
