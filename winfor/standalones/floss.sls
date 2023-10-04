# Name: FLOSS (FLARE Obfuscated String Solver)
# Website: https://github.com/mandiant/flare-floss
# Description: Extract obfuscated strings from malware
# Category: Executables
# Author: Mandiant
# License: Apache License v2.0 (https://github.com/mandiant/flare-floss/blob/master/LICENSE.txt)
# Version: 2.3.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.3.0' %}
{% set hash = '30afca951815545e68c76feae0675127fe742e5b3b16f75ba751aef3985ab053' %}
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
