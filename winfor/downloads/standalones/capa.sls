# Name: capa
# Website: https://github.com/mandiant/capa
# Description: FLARE tool to identify capabilities in executables
# Category: Executables
# Author: Mandiant
# License: Apache License 2.0 (https://github.com/mandiant/capa/blob/master/LICENSE.txt)
# Version: 4.0.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.0.1' %}
{% set hash = '8a2f95b56c88d38b2f33be92cd3c320f090ce8bb6b9e563457b12e456f3e449f' %}

capa-download-only:
  file.managed:
    - name: '{{ downloads }}\capa-v{{ version }}-windows.zip'
    - source: https://github.com/mandiant/capa/releases/download/v{{ version }}/capa-v{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

capa-rules-only:
  git.latest:
    - name: https://github.com/mandiant/capa-rules.git
    - target: '{{ downloads }}\capa-rules'
    - rev: master
    - force_clone: True
    - force_reset: True
