# Name: FLOSS (FLARE Obfuscated String Solver)
# Website: https://github.com/mandiant/flare-floss
# Description: Extract obfuscated strings from malware
# Category: Executables
# Author: Mandiant
# License: Apache License v2.0 (https://github.com/mandiant/flare-floss/blob/master/LICENSE.txt)
# Version: 3.1.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.1.1' %}
{% set hash = '6c71089b8c629c69424b042769f1565f71adc6cd24b2f8d3713c96fa7fdac2fb' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

floss-download:
  file.managed:
    - name: 'C:\salt\tempdownload\floss-v{{ version }}-windows.zip'
    - source: https://github.com/mandiant/flare-floss/releases/download/v{{ version }}/floss-v{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

floss-extract:
  archive.extracted:
    - name: '{{ inpath }}\floss'
    - source: 'C:\salt\tempdownload\floss-v{{ version }}-windows.zip'
    - enforce_toplevel: False
    - require:
      - file: floss-download

floss-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\floss\'
