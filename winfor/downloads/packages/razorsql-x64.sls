# Name: RazorSQL
# Website: https://razorsql.com
# Description: SQL Database analysis tool
# Category: Databases
# Author: Richardson Software LLC
# License: https://razorsql.com/license.txt
# Version: 10.4.5
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '10_4_5' %}
{% set hash = '58e42157adf7b743a27eb814fd970d922dd9349296e7d0431da3b99a9f602a85' %}

razorsql-x64-download-only:
  file.managed:
    - name: '{{ downloads }}\razorsql{{ version }}_setup_x64.exe'
    - source: https://s3.dualstack.us-east-1.amazonaws.com/downloads.razorsql.com/downloads/{{ version }}/razorsql{{ version }}_setup_x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
