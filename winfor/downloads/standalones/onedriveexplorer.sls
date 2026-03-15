# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2026.01.06
# Notes:

{% set version = '2026.01.06' %}
{% set hash = 'c46ca6d010c6fd0e0a09963c54697e5c04a48dcc49082f737e90e397b00a2c0c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winfor-standalones-onedriveexplorer-download-only:
  file.managed:
    - name: '{{ downloads }}\onedriveexplorer\onedriveexplorer-{{ version }}.zip'
    - source: https://github.com/Beercow/OneDriveExplorer/releases/download/v{{ version }}/ODE.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
