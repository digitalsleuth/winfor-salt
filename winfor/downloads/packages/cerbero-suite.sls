# Name: Cerbero Suite
# Website: https://cerbero.io
# Description: Application Analysis for Reverse Engineering
# Category: Acquisition and Analysis
# Author: Cerbero.io
# License: 
# Version: 6.2.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.2.1' %}
{% set hash = 'FDB6A463DD71689E107358AC2D259FF5593EB79EF53E89B437059856AA163322' %}

cerbero-suite-download-only:
  file.managed:
    - name: '{{ downloads }}\cerbero_suite_{{ version }}_x64_setup.exe'
    - source: https://store.cerbero.io/static/downloads/csuite/cerbero_suite_{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
