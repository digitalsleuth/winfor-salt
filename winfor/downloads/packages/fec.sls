# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 4.1.423.1108
# Notes:

{% set version = '4.1.423.1108' %}
{% set hash = 'a98228921899f9bcf83256579433c3af45abab8fe4dfb5234b8dd1513cd91f89' %}
{% set folder_hash = 'd3187a9db3b8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fec-download-only:
  file.managed:
    - name: '{{ downloads }}\fec\FECSetup_v{{ version }}.msi'
    - source: https://storage.googleapis.com/fec-downloads/FEC/{{ version }}_{{ folder_hash }}/FECSetup_v{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
