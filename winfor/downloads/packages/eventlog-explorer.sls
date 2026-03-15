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
{% set hash = '45fdb740ea5acbfc1b5386b019fa0bb6d19fa5cae382bebd01834f11d725df12' %}

eventlog-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\eventlog-explorer\elex_setup-{{ version }}.exe'
    - source: https://eventlogxp.com/download/elex_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
