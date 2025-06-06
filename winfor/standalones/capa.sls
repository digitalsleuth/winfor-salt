# Name: capa
# Website: https://github.com/mandiant/capa
# Description: FLARE tool to identify capabilities in executables
# Category: Executables
# Author: Mandiant
# License: Apache License 2.0 (https://github.com/mandiant/capa/blob/master/LICENSE.txt)
# Version: 9.1.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '9.1.0' %}
{% set hash = '579194136730e9c6b31254abca12382534f4eef8b8b4bcf718cc4b31cfb96e05' %}

include:
  - winfor.packages.git

capa-download:
  file.managed:
    - name: 'C:\salt\tempdownload\capa-v{{ version }}-windows.zip'
    - source: https://github.com/mandiant/capa/releases/download/v{{ version }}/capa-v{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

capa-extract:
  archive.extracted:
    - name: '{{ inpath }}\capa'
    - source: 'C:\salt\tempdownload\capa-v{{ version }}-windows.zip'
    - enforce_toplevel: False
    - require:
      - file: capa-download

capa-rules:
  git.latest:
    - name: https://github.com/mandiant/capa-rules.git
    - target: '{{ inpath }}\capa\capa-rules'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git
      - archive: capa-extract

capa-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\capa\'
