# Name: evtx_dump
# Website: https://github.com/omerbenamram/evtx
# Description: EVTX Event Log Parser
# Category: Logs
# Author: Omer BenAmram
# License: Apache License v2 (https://github.com/omerbenamram/evtx/blob/master/LICENSE-APACHE) and MIT License (https://github.com/omerbenamram/evtx/blob/master/LICENSE-MIT)
# Version: 0.11.2
# Notes: 

{% set version = '0.11.2' %}
{% set hash = 'ce131b78f630fa6278b4fb6bae5e4f7bebf7250612cfc89466f627bf78f6681b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

evtx-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\evtx-dump\evtx_dump-v{{ version }}.exe'
    - source: https://github.com/omerbenamram/evtx/releases/download/v{{ version }}/evtx_dump-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
