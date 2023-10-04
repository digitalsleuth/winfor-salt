# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2023.09.22
# Notes:

{% set version = '2023.09.22' %}
{% set hash = '88c1ed6aeff727a760cebbd4bdf20bd4db359bd7370b17bda75ce6ce304ef22d' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winfor-standalones-onedriveexplorer-download-only:
  file.managed:
    - name: '{{ downloads }}\ode.zip'
    - source: https://github.com/Beercow/OneDriveExplorer/releases/download/v{{ version }}/ode.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
