# Name: RazorSQL
# Website: https://razorsql.com
# Description: SQL Database analysis tool
# Category: Databases
# Author: Richardson Software LLC
# License: https://razorsql.com/license.txt
# Version: 10.6.8
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '10.6.8' %}
{% set underscore = version | replace(".","_") %}
{% set hash = 'c6a67a8eacc9e784560d2c8be40d5fef89cebebe01e19a5adc57beb77072a334' %}

razorsql-x64-download-only:
  file.managed:
    - name: '{{ downloads }}\razorsql\razorsql-{{ version }}.exe'
    - source: https://s3.dualstack.us-east-1.amazonaws.com/downloads.razorsql.com/downloads/{{ underscore }}/razorsql{{ underscore }}_setup_x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
