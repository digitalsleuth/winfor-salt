# Name: evtx_dump
# Website: https://github.com/omerbenamram/evtx
# Description: EVTX Event Log Parser
# Category: Logs
# Author: Omer BenAmram
# License: Apache License v2 (https://github.com/omerbenamram/evtx/blob/master/LICENSE-APACHE) and MIT License (https://github.com/omerbenamram/evtx/blob/master/LICENSE-MIT)
# Version: 0.12.2
# Notes: 

{% set version = '0.12.2' %}
{% set hash = 'fdc170115cbb84eadc4ef5ed66807be08d24aab7383324b562b78d8035f9f16a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

evtx-dump-download-only:
  file.managed:
    - name: '{{ downloads }}\evtx-dump\evtx-dump-{{ version }}.exe'
    - source: https://github.com/omerbenamram/evtx/releases/download/v{{ version }}/evtx_dump-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
