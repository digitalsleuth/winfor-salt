# Name: evtx_dump
# Website: https://github.com/omerbenamram/evtx
# Description: EVTX Event Log Parser
# Category: Logs
# Author: Omer BenAmram
# License: Apache License v2 (https://github.com/omerbenamram/evtx/blob/master/LICENSE-APACHE) and MIT License (https://github.com/omerbenamram/evtx/blob/master/LICENSE-MIT)
# Version: 0.13.0
# Notes: 

{% set version = '0.13.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('evtx-dump') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

evtx-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\evtx-dump\evtx-dump-{{ version }}.exe'
    - source: https://github.com/omerbenamram/evtx/releases/download/v{{ version }}/evtx_dump-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
