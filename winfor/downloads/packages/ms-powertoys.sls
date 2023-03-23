# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.64.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.64.1' %}
{% set hash = '0110ee62579462d509086d50f65ea44196f52624b08cdc8c9e1cbb8a7ffd4f35' %}

ms-powertoys-download-only:
  file.managed:
    - name: '{{ downloads }}\PowerToysSetup-{{ version }}-x64.exe'
    - source: https://github.com/microsoft/PowerToys/releases/download/v{{ version }}/PowerToysSetup-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
