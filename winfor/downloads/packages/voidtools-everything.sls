# Name: Voidtools Everything
# Website: https://www.voidtools.com
# Description: File Search Utility
# Category: Utilities
# Author: David Carpenter
# License: https://www.voidtools.com/License.txt
# Version: 1.4.1.1027
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.4.1.1027' %}
{% set hash = '8cda27718b0e9d69fc45a66d592a390f2681f1db9649797a0536dfe5a5253032' %}

voidtools-everything-download-only:
  file.managed:
    - name: '{{ downloads }}\voidtools-everything\Everything-{{ version }}.x64-Setup.exe'
    - source: https://www.voidtools.com/Everything-{{ version }}.x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
