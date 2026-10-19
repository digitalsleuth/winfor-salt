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
{% set hash = '8712991044321dbb2a5b0d60f7a5327a50c9c30a295e7ddb5c1088cb17fb59df' %}

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
