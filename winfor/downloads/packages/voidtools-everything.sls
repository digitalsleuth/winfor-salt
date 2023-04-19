# Name: Voidtools Everything
# Website: https://www.voidtools.com
# Description: File Search Utility
# Category: Utilities
# Author: David Carpenter
# License: https://www.voidtools.com/License.txt
# Version: 1.4.1.1022
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.4.1.1022' %}
{% set hash = '488d285760eb1aeb148e2aec18a2f063571a6630acb26a02b6751c56ca4a95be' %}

voidtools-everything-download-only:
  file.managed:
    - name: '{{ downloads }}\Everything-{{ version }}.x64-Setup.exe'
    - source: https://www.voidtools.com/Everything-{{ version }}.x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
