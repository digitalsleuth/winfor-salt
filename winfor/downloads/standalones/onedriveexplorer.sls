# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2023.05.05
# Notes:

{% set version = '2023.05.05' %}
{% set hash = 'db1522ce187338df70d185621a1187ed0bab6520630274f48c02419bf1d18695' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winfor-standalones-onedriveexplorer-download-only:
  file.managed:
    - name: '{{ downloads }}\ode.zip'
    - source: https://github.com/Beercow/OneDriveExplorer/releases/download/v{{ version }}/ode.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
