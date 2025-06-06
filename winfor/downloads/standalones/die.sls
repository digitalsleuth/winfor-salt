# Name: DIE (Detect It Easy)
# Website: https://github.com/horsicq/DIE-engine
# Description: Reverse Engineering Engine
# Category: Executables
# Author: Hors (horsicq)
# License: MIT License (https://github.com/horsicq/DIE-engine/blob/master/LICENSE)
# Version: 3.10
# Notes: Detect It Easy - DIE 

{% set version = '3.10' %}
{% set hash = '6e84ac8d3abdfba60078a36fa7f6b492b20c2af2c502e0a4579f41367ac37c80' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

die-download-only:
  file.managed:
    - name: '{{ downloads }}\die\die_win64_portable_{{ version }}_x64.zip'
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_win64_portable_{{ version }}_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
