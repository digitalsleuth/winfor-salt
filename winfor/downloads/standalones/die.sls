# Name: DIE (Detect It Easy)
# Website: https://github.com/horsicq/DIE-engine
# Description: Reverse Engineering Engine
# Category: Executables
# Author: Hors (horsicq)
# License: MIT License (https://github.com/horsicq/DIE-engine/blob/master/LICENSE)
# Version: 3.06
# Notes: Detect It Easy - DIE 

{% set version = '3.06' %}
{% set hash = 'f1f075145a7b5ee8556dbf8a66c4e64e6b7eff71bcfeaed669f8f8471862fac9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

die-download-only:
  file.managed:
    - name: '{{ downloads }}\die_win64_portable_{{ version }}.zip'
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_win64_portable_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
