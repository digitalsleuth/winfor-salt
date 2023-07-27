# Name: DIE (Detect It Easy)
# Website: https://github.com/horsicq/DIE-engine
# Description: Reverse Engineering Engine
# Category: Executables
# Author: Hors (horsicq)
# License: MIT License (https://github.com/horsicq/DIE-engine/blob/master/LICENSE)
# Version: 3.08
# Notes: Detect It Easy - DIE 

{% set version = '3.08' %}
{% set hash = 'a6b9ea7ea2e06a048ac4aef3d27020fbc383bbad448da6c767118ebfd2449d5e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

die-download-only:
  file.managed:
    - name: '{{ downloads }}\die_win64_portable_{{ version }}_x64.zip'
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_win64_portable_{{ version }}_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
