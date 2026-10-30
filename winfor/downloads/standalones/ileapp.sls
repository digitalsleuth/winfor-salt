# Name: ILEAPP
# Website: https://github.com/abrignoni/ileapp
# Description: iOS Logs Events and Plists Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/iLEAPP/blob/main/LICENSE)
# Version: 2026.4.5
# Notes: 

# renovate: datasource=github-releases depName=abrignoni/iLEAPP
{% set version = '2026.4.5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ileapp') %}

ileapp-download-only:
  file.managed:
    - name: '{{ downloads }}\ileapp\ileapp-{{ version }}.zip'
    - source: https://github.com/abrignoni/iLEAPP/releases/download/v{{ version }}/iLEAPP-{{ version }}-windows-x64-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
