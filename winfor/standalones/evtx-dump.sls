# Name: evtx_dump
# Website: https://github.com/omerbenamram/evtx
# Description: EVTX Event Log Parser
# Category: Logs
# Author: Omer BenAmram
# License: Apache License v2 (https://github.com/omerbenamram/evtx/blob/master/LICENSE-APACHE) and MIT License (https://github.com/omerbenamram/evtx/blob/master/LICENSE-MIT)
# Version: 0.11.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.11.1' %}
{% set hash = '0b474984975d40683a65d4e12503f6b58ba2eea7e2c99b18dafac986bf7735b6' %}

include:
  - winfor.config.shims

evtx-dump:
  file.managed:
    - name: '{{ inpath }}\evtx-dump\evtx_dump.exe'
    - source: https://github.com/omerbenamram/evtx/releases/download/v{{ version }}/evtx_dump-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

evtx-dump-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\evtx-dump\evtx_dump.exe -OutPath {{ inpath }}\shims\evtx-dump.exe'
    - require:
      - sls: winfor.config.shims
