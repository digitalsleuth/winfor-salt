# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2025.05.30
# Notes:

{% set version = '2025.05.30' %}
{% set hash = '08dffab933ca9033c76f26a4f407311736d5f50dcb365e0673c3e27b39f0e5fd' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winfor-standalones-onedriveexplorer-download-only:
  file.managed:
    - name: '{{ downloads }}\onedriveexplorer\onedriveexplorer-{{ version }}.zip'
    - source: https://github.com/Beercow/OneDriveExplorer/releases/download/v{{ version }}/ODE.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
