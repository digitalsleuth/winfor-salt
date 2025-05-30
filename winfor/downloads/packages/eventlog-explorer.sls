# Name: Event Log Explorer
# Website: https://eventlogxp.com/
# Description: Windows Event Log Parser
# Category: Windows Analysis
# Author: FSPro
# License: Multiple (https://eventlogxp.com/order.html)
# Version: 5.6
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.6' %}
{% set hash = '00abac84773a33728d57100a7e900e62376ccffa' %}

eventlog-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\eventlog-explorer\elex_setup-{{ version }}.exe'
    - source: https://eventlogxp.com/download/elex_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
