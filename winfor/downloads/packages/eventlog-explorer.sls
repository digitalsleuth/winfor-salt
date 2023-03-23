# Name: Event Log Explorer
# Website: https://eventlogxp.com/
# Description: Windows Event Log Parser
# Category: Windows Analysis
# Author: FSPro
# License: Multiple (https://eventlogxp.com/order.html)
# Version: 5.3
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.3' %}
{% set hash = '521e576feae2e21f7335760f915dd06cc4ed1cc8c09ed32196f656bb0ccb4a80' %}

eventlog-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\elex_setup.exe'
    - source: https://eventlogxp.com/download/elex_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
