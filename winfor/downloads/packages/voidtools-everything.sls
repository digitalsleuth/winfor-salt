# Name: Voidtools Everything
# Website: https://www.voidtools.com
# Description: File Search Utility
# Category: Utilities
# Author: David Carpenter
# License: https://www.voidtools.com/License.txt
# Version: 1.4.1.1032
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.4.1.1032' %}
{% set hash = 'c42efad041d4c0bb4d4ac97ae7cbe89f153ec1fe078772392e749c7f5d5282d3' %}

voidtools-everything-download-only:
  file.managed:
    - name: '{{ downloads }}\voidtools-everything\voidtools-everything-{{ version }}.exe'
    - source: https://www.voidtools.com/Everything-{{ version }}.x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
