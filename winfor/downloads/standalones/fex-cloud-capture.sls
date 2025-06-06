# Name: FEX Cloud Capture
# Website: https://getdataforensics.com
# Description: Cloud Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.20
# Notes: 

{% set version = '1.20' %}
{% set hash = '80ad5221522ba83f04d0a5af29c8b3e60a1d9e6c96932683c334f21b5e35d0ec' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-cloud-capture-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-cloud-capture\FEX-Cloud-Capture-64bit-(v{{ version }}).zip'
    - source: https://download.getdata.com/support/fex/cloud/FEX-Cloud-Capture-64bit-(v{{ version }}).zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
