# Name: Voidtools Everything
# Website: https://www.voidtools.com
# Description: File Search Utility
# Category: Utilities
# Author: David Carpenter
# License: https://www.voidtools.com/License.txt
# Version: 1.4.1.1026
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.4.1.1026' %}
{% set hash = 'dae32a49b6052f0ec70895dd4e35b2b26222f7f4c19c36d9d309033e2fb622bc' %}

voidtools-everything-download-only:
  file.managed:
    - name: '{{ downloads }}\voidtools-everything\Everything-{{ version }}.x64-Setup.exe'
    - source: https://www.voidtools.com/Everything-{{ version }}.x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
