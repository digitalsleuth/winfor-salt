# Name: evtx_dump
# Website: https://github.com/omerbenamram/evtx
# Description: EVTX Event Log Parser
# Category: Logs
# Author: Omer BenAmram
# License: Apache License v2 (https://github.com/omerbenamram/evtx/blob/master/LICENSE-APACHE) and MIT License (https://github.com/omerbenamram/evtx/blob/master/LICENSE-MIT)
# Version: 0.9.0
# Notes: 

{% set version = '0.9.0' %}
{% set hash = '318379ecdc642217b91ce2c8f2097a94705270414762fbbdc8c23b92a73278a4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

evtx-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\evtx-dump\evtx_dump-{{ version }}.exe'
    - source: https://github.com/omerbenamram/evtx/releases/download/v{{ version }}/evtx_dump-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
