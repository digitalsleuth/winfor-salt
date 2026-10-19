# Name: FEX Cloud Capture
# Website: https://getdataforensics.com
# Description: Cloud Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.30
# Notes: 

{% set version = '1.30' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('fex-cloud-capture') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fex-cloud-capture-download-only:
  file.managed:
    - name: '{{ downloads }}\fex-cloud-capture\fex-cloud-capture-{{ version }}.zip'
    - source: https://download.getdata.com/support/fex/cloud/FEX-Cloud-Capture-64bit-(v{{ version }}).zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
