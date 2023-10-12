# Name: Windows Timeline
# Website: https://github.com/kacos2000/WindowsTimeline
# Description: Windows Timeline / Activities Cache parser
# Category: Windows Analysis
# Author: Costas K.
# License: Mozilla Public License v2.0 (https://github.com/kacos2000/WindowsTimeline/blob/master/LICENSE)
# Version: 2.0.82.0
# Notes:

{% set version = '2.0.82.0' %}
{% set hash = '87af5824e86c20f13e6d45595e98801a63d2ff9af4ded011066df754652f5780' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windowstimeline-download-only:
  file.managed:
    - name: '{{ downloads }}\windows-timeline\WindowsTimeline-{{ version }}.exe'
    - source: https://github.com/kacos2000/WindowsTimeline/releases/download/v.{{ version }}/WindowsTimeline.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
