# Name: UFADE (Universal Forensic Apple Device Extractor)
# Website: https://github.com/prosch88/UFADE
# Description: Standalone tool to extract data from Apple Devices
# Category: Mobile Analysis
# Author: prosch88
# License: GNU General Public License 3 (https://github.com/prosch88/UFADE/blob/main/LICENSE)
# Version: 0.9.4
# Notes: 

{% set version = '0.9.4' %}
{% set hash = '054f612e9c6d7c9010a080abb6070e60955fa98221a1b89c35aed8982177be8b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ufade-download-only:
  file.managed:
    - name: '{{ downloads }}\ufade\UFADE_{{ version }}_win_x64.zip'
    - source: https://github.com/prosch88/UFADE/releases/download/v{{ version }}/UFADE_{{ version }}_win_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
