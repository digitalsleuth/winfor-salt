# Name: VLEAPP
# Website: https://github.com/abrignoni/vleapp
# Description: Vehicle Logs Events and Properties Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/VLEAPP/blob/main/LICENSE)
# Version: 2026.4.4
# Notes: 

# renovate: datasource=github-releases depName=abrignoni/VLEAPP
{% set version = '2026.4.4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('vleapp') %}

vleapp-download-only:
  file.managed:
    - name: '{{ downloads }}\vleapp\vleapp-{{ version }}.zip'
    - source: https://github.com/abrignoni/VLEAPP/releases/download/v{{ version }}/VLEAPP-{{ version }}-windows-x64-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
