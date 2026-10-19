# Name: capa
# Website: https://github.com/mandiant/capa
# Description: FLARE tool to identify capabilities in executables
# Category: Executables
# Author: Mandiant
# License: Apache License 2.0 (https://github.com/mandiant/capa/blob/master/LICENSE.txt)
# Version: 10.0.0
# Notes: 

{% set version = '10.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('capa') %}

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
