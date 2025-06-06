# Name: RazorSQL
# Website: https://razorsql.com
# Description: SQL Database analysis tool
# Category: Databases
# Author: Richardson Software LLC
# License: https://razorsql.com/license.txt
# Version: 10.6.5
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '10_6_5' %}
{% set hash = '6a152577aed473084b124e6b7e59a247140c1b132e5c4352d0bcfe6c97c212ab' %}

razorsql-x64-download-only:
  file.managed:
    - name: '{{ downloads }}\razorsql\razorsql{{ version }}_setup_x64.exe'
    - source: https://s3.dualstack.us-east-1.amazonaws.com/downloads.razorsql.com/downloads/{{ version }}/razorsql{{ version }}_setup_x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
