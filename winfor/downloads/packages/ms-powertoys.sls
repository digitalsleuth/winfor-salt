# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.83.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.83.0' %}
{% set hash = '7ec435a10849187d21a383e56a69213c1ff110b7feca65900d9319d2f8162f35' %}

ms-powertoys-download-only:
  file.managed:
    - name: '{{ downloads }}\powertoys\PowerToysSetup-{{ version }}-x64.exe'
    - source: https://github.com/microsoft/PowerToys/releases/download/v{{ version }}/PowerToysSetup-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
