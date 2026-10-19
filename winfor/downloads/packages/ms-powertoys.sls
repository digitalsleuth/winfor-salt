# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.100.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.100.2' %}
{% set hash = '73c04aac8052420111fe5cdc0098ec8415d87cbdbd42de253e9af959781cbf9e' %}

ms-powertoys-download-only:
  file.managed:
    - name: '{{ downloads }}\powertoys\powertoys-{{ version }}.exe'
    - source: https://github.com/microsoft/PowerToys/releases/download/v{{ version }}/PowerToysSetup-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
