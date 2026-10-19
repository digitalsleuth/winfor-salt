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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('voidtools-everything') %}

voidtools-everything-download-only:
  file.managed:
    - name: '{{ downloads }}\voidtools-everything\voidtools-everything-{{ version }}.exe'
    - source: https://www.voidtools.com/Everything-{{ version }}.x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
