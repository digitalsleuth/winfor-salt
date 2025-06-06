# Name: capa
# Website: https://github.com/mandiant/capa
# Description: FLARE tool to identify capabilities in executables
# Category: Executables
# Author: Mandiant
# License: Apache License 2.0 (https://github.com/mandiant/capa/blob/master/LICENSE.txt)
# Version: 9.1.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '9.1.0' %}
{% set hash = '579194136730e9c6b31254abca12382534f4eef8b8b4bcf718cc4b31cfb96e05' %}

capa-download-only:
  file.managed:
    - name: '{{ downloads }}\capa\capa-v{{ version }}-windows.zip'
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
