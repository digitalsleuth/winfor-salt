# Name: Windows Timeline
# Website: https://github.com/kacos2000/WindowsTimeline
# Description: Windows Timeline / Activities Cache parser
# Category: Windows Analysis
# Author: Costas K.
# License: Mozilla Public License v2.0 (https://github.com/kacos2000/WindowsTimeline/blob/master/LICENSE)
# Version: 2.0.82.0
# Notes:

{% set version = '2.0.82.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('windows-timeline') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windowstimeline-download-only:
  file.managed:
    - name: '{{ downloads }}\windowstimeline\windowstimeline-{{ version }}.exe'
    - source: https://github.com/kacos2000/WindowsTimeline/releases/download/v.{{ version }}/WindowsTimeline.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
