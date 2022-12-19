# Name: capa
# Website: https://github.com/mandiant/capa
# Description: FLARE tool to identify capabilities in executables
# Category: Executables
# Author: Mandiant
# License: Apache License 2.0 (https://github.com/mandiant/capa/blob/master/LICENSE.txt)
# Version: 4.0.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '4.0.1' %}
{% set hash = '8a2f95b56c88d38b2f33be92cd3c320f090ce8bb6b9e563457b12e456f3e449f' %}

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
