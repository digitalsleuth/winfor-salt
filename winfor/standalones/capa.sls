# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = 'v3.1.0' %}
{% set hash = 'ffdc822d078465c4591ccd39ded1fd6e2c6af79cf50726b2ecce481f9338dd1e' %}

include:
  - winfor.packages.git

capa-download:
  file.managed:
    - name: 'C:\salt\tempdownload\capa-{{ version }}-windows.zip'
    - source: https://github.com/mandiant/capa/releases/download/{{ version }}/capa-{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

capa-extract:
  archive.extracted:
    - name: 'C:\standalone\capa'
    - source: 'C:\salt\tempdownload\capa-{{ version }}-windows.zip'
    - enforce_toplevel: False
    - require:
      - file: capa-download

capa-rules:
  git.latest:
    - name: https://github.com/mandiant/capa-rules.git
    - target: 'C:\standalone\capa\capa-rules'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git
      - archive: capa-extract

capa-env-vars:
  win_path.exists:
    - name: 'C:\standalone\capa\'
