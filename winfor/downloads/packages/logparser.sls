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
{% set hash = '7bbfdfb52a8d92a105ed2fccdf0e44d8fb2ed49f0358390dd921886c14e9e32c' %}

logparser-download-only:
  file.managed:
    - name: '{{ downloads }}\logparser\LogParser-{{ version }}.msi'
    - source: https://download.microsoft.com/download/f/f/1/ff1819f9-f702-48a5-bbc7-c9656bc74de8/LogParser.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
