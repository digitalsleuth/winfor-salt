# Name: API Monitor v2 Alpha
# Website: http://www.rohitab.com/apimonitor
# Description: Tool to monitor API calls by applications
# Category: Executables
# Author: Rohitab Batra
# License: 
# Version: v2r13
# Notes: 

{% set version = 'v2r13' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('apimonitor') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

apimonitor-download-only:
  file.managed:
    - name: '{{ downloads }}\api-monitor\api-monitor-{{ version }}.exe'
    - source: http://www.rohitab.com/download/api-monitor-{{ version }}-setup-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
