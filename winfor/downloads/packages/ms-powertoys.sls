# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.72.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.72.0' %}
{% set hash = '9925894d797458c78a8c3df6fe4bd748580638b01bb43680477763662915109a' %}

ms-powertoys-download-only:
  file.managed:
    - name: '{{ downloads }}\PowerToysSetup-{{ version }}-x64.exe'
    - source: https://github.com/microsoft/PowerToys/releases/download/v{{ version }}/PowerToysSetup-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
