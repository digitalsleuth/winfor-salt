# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.74.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.74.1' %}
{% set hash = '298c6f4e4391bdc06e128bed86a303c3300a68eaf754b4630af7542c78c0944a' %}

ms-powertoys-download-only:
  file.managed:
    - name: '{{ downloads }}\PowerToysSetup-{{ version }}-x64.exe'
    - source: https://github.com/microsoft/PowerToys/releases/download/v{{ version }}/PowerToysSetup-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
