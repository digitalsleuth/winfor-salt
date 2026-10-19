# Name: evtx_dump
# Website: https://github.com/omerbenamram/evtx
# Description: EVTX Event Log Parser
# Category: Logs
# Author: Omer BenAmram
# License: Apache License v2 (https://github.com/omerbenamram/evtx/blob/master/LICENSE-APACHE) and MIT License (https://github.com/omerbenamram/evtx/blob/master/LICENSE-MIT)
# Version: 0.12.3
# Notes: 

{% set version = '0.12.3' %}
{% set hash = '5e5480758e95ec6cd8cc77c3899ed0d1afc762ec1e2832c93af129957c8e95b3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

evtx-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\evtx-dump\evtx-dump-{{ version }}.exe'
    - source: https://github.com/omerbenamram/evtx/releases/download/v{{ version }}/evtx_dump-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
