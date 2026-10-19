# Name: Log Parser
# Website: https://www.microsoft.com
# Description: Event Log parser
# Category: Logs
# Author: Microsoft
# License: 
# Version: 2.2.10
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.2.10' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('logparser') %}

logparser-download-only:
  file.managed:
    - name: '{{ downloads }}\logparser\logparser-{{ version }}.msi'
    - source: https://download.microsoft.com/download/f/f/1/ff1819f9-f702-48a5-bbc7-c9656bc74de8/LogParser.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
