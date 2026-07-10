# Name: UFADE (Universal Forensic Apple Device Extractor)
# Website: https://github.com/prosch88/UFADE
# Description: Standalone tool to extract data from Apple Devices
# Category: Mobile Analysis
# Author: Christian Peter (prosch88)
# License: GNU General Public License 3 (https://github.com/prosch88/UFADE/blob/main/LICENSE)
# Version: 1.0.4
# Notes: 

{% set version = '1.0.4' %}
{% set hash = '92aede5659f9b0807c1133a68ae3319ffb3d8baf2f9ef1a43436a1ba4b8fd00a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ufade-download-only:
  file.managed:
    - name: '{{ downloads }}\ufade\ufade-{{ version }}.zip'
    - source: https://github.com/prosch88/UFADE/releases/download/v{{ version }}/UFADE_{{ version }}_win_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
