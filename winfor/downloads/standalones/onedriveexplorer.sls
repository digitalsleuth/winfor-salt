# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2026.06.29
# Notes:

{% set version = '2026.06.29' %}
{% set hash = '5560cb3cab51f1cf7b28d0a17c06e94854922302b4f7f09218b8a0a4d8abce63' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winfor-standalones-onedriveexplorer-download-only:
  file.managed:
    - name: '{{ downloads }}\onedriveexplorer\onedriveexplorer-{{ version }}.zip'
    - source: https://github.com/Beercow/OneDriveExplorer/releases/download/v{{ version }}/ODE.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
