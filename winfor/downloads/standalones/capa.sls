# Name: capa
# Website: https://github.com/mandiant/capa
# Description: FLARE tool to identify capabilities in executables
# Category: Executables
# Author: Mandiant
# License: Apache License 2.0 (https://github.com/mandiant/capa/blob/master/LICENSE.txt)
# Version: 9.4.0
# Notes: 

{% set version = '9.4.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '670ab1a58b81f59cb57533bf4021ac1e7033fbe9b5d5cc180f796976081e3bb5' %}

capa-download-only:
  file.managed:
    - name: '{{ downloads }}\capa\capa-{{ version }}.zip'
    - source: https://github.com/mandiant/capa/releases/download/v{{ version }}/capa-v{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

capa-rules-only:
  git.latest:
    - name: https://github.com/mandiant/capa-rules.git
    - target: '{{ downloads }}\capa\capa-rules'
    - rev: master
    - force_clone: True
    - force_reset: True
