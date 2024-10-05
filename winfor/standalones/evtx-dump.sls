# Name: evtx_dump
# Website: https://github.com/omerbenamram/evtx
# Description: EVTX Event Log Parser
# Category: Logs
# Author: Omer BenAmram
# License: Apache License v2 (https://github.com/omerbenamram/evtx/blob/master/LICENSE-APACHE) and MIT License (https://github.com/omerbenamram/evtx/blob/master/LICENSE-MIT)
# Version: 0.8.3
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.8.3' %}
{% set hash = 'c207fa39ee6132cbc0c30fdf58109fadc5ef2f4e078cd542ffb177ef0c44e918' %}

evtx-dump:
  file.managed:
    - name: '{{ inpath }}\evtx-dump\evtx_dump.exe'
    - source: https://github.com/omerbenamram/evtx/releases/download/v{{ version }}/evtx_dump-v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

evtx-dump-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\evtx-dump\'
