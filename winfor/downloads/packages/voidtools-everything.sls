# Name: Voidtools Everything
# Website: https://www.voidtools.com
# Description: File Search Utility
# Category: Utilities
# Author: David Carpenter
# License: https://www.voidtools.com/License.txt
# Version: 1.4.1.1024
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.4.1.1024' %}
{% set hash = 'b2afe799584c913532c673f99ade45113bf5a5b605a964ce9fa837f563b6fc21' %}

voidtools-everything-download-only:
  file.managed:
    - name: '{{ downloads }}\Everything-{{ version }}.x64-Setup.exe'
    - source: https://www.voidtools.com/Everything-{{ version }}.x64-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
