# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.91.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.91.1' %}
{% set hash = 'ec4bc3a8625775866b0ed4577ccf83e6ec7b1a0ad267379ddbaf4fe49c7b5bdd' %}

ms-powertoys-download-only:
  file.managed:
    - name: '{{ downloads }}\powertoys\PowerToysSetup-{{ version }}-x64.exe'
    - source: https://github.com/microsoft/PowerToys/releases/download/v{{ version }}/PowerToysSetup-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
