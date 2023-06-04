# Name: Cerbero Suite
# Website: https://cerbero.io
# Description: Application Analysis for Reverse Engineering
# Category: Acquisition and Analysis
# Author: Cerbero.io
# License: 
# Version: 6.5.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.5.0' %}
{% set hash = '8820E66610AE7278921C52AD22349D0106D98AB0D0F8D6E7CC10C18E7A36B8C9' %}

cerbero-suite-download-only:
  file.managed:
    - name: '{{ downloads }}\cerbero_suite_{{ version }}_x64_setup.exe'
    - source: https://store.cerbero.io/static/downloads/csuite/cerbero_suite_{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
