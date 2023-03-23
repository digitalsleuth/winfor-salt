# Name: RazorSQL
# Website: https://razorsql.com
# Description: SQL Database analysis tool
# Category: Databases
# Author: Richardson Software LLC
# License: https://razorsql.com/license.txt
# Version: 10.1.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '10_1_1' %}
{% set hash = '4f223e1d899c839e41cdd133a94b32eddfd0a1ac4634c057558bfb5c906351d4' %}

razorsql-x64-download-only:
  file.managed:
    - name: '{{ downloads }}\razorsql{{ version }}_setup_x64.exe'
    - source: https://s3.dualstack.us-east-1.amazonaws.com/downloads.razorsql.com/downloads/{{ version }}/razorsql{{ version }}_setup_x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
