# Name: Event Log Explorer
# Website: https://eventlogxp.com/
# Description: Windows Event Log Parser
# Category: Windows Analysis
# Author: FSPro
# License: Multiple (https://eventlogxp.com/order.html)
# Version: 5.4
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.4' %}
{% set hash = '9015c3a52f46362033f2d42b51df106167de89bcbb044636c50ef62c45bf8313' %}

eventlog-explorer-download-only:
  file.managed:
    - name: '{{ downloads }}\eventlog-explorer\elex_setup-{{ version }}.exe'
    - source: https://eventlogxp.com/download/elex_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
