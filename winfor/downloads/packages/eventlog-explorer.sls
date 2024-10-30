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
{% set hash = 'c66638722f2012138b2bfa8c8095658e5bd8b5c2659e294b5d9b425e3513d333' %}

eventlog-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\eventlog-explorer\elex_setup-{{ version }}.exe'
    - source: https://eventlogxp.com/download/elex_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
