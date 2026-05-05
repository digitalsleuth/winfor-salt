# Name: UFADE (Universal Forensic Apple Device Extractor)
# Website: https://github.com/prosch88/UFADE
# Description: Standalone tool to extract data from Apple Devices
# Category: Mobile Analysis
# Author: Christian Peter (prosch88)
# License: GNU General Public License 3 (https://github.com/prosch88/UFADE/blob/main/LICENSE)
# Version: 1.0.3
# Notes: 

{% set version = '1.0.3' %}
{% set hash = '0fbd206acbc07de87b7c073c6d956e40c801046304b58c500daa8a7e349b5cb5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ufade-download-only:
  file.managed:
    - name: '{{ downloads }}\ufade\UFADE_{{ version }}_win_x64.zip'
    - source: https://github.com/prosch88/UFADE/releases/download/v{{ version }}/UFADE_{{ version }}_win_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
