# Name: Event Log Explorer
# Website: https://eventlogxp.com/
# Description: Windows Event Log Parser
# Category: Windows Analysis
# Author: FSPro
# License: Multiple (https://eventlogxp.com/order.html)
# Version: 5.8
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.8' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('eventlog-explorer') %}

eventlog-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\eventlog-explorer\eventlog-explorer-{{ version }}.exe'
    - source: https://eventlogxp.com/download/elex_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
