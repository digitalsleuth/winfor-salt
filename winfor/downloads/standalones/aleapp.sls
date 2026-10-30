# Name: ALEAPP
# Website: https://github.com/abrignoni/aleapp
# Description: Android Logs Events and Protobuf Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/ALEAPP/blob/main/LICENSE)
# Version: 2026.4.4
# Notes: 

# renovate: datasource=github-releases depName=abrignoni/ALEAPP
{% set version = '2026.4.4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('aleapp') %}

aleapp-download-only:
  file.managed:
    - name: '{{ downloads }}\aleapp\aleapp-{{ version }}.zip'
    - source: https://github.com/abrignoni/ALEAPP/releases/download/v{{ version }}/ALEAPP-{{ version }}-windows-x64-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
