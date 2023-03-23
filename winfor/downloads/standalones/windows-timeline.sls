# Name: Windows Timeline
# Website: https://github.com/kacos2000/WindowsTimeline
# Description: Windows Timeline / Activities Cache parser
# Category: Windows Analysis
# Author: Costas K.
# License: Mozilla Public License v2.0 (https://github.com/kacos2000/WindowsTimeline/blob/master/LICENSE)
# Version: 2.0.81.0
# Notes:

{% set version = '2.0.81.0' %}
{% set hash = '19ED58E42108A8E2BF8D19A3B6EA89C1AA8B7C13387ACBEA1A0CB40304FC4E83' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windowstimeline-download-only:
  file.managed:
    - name: '{{ downloads }}\WindowsTimeline.exe'
    - source: https://github.com/kacos2000/WindowsTimeline/releases/download/v.2.0.81.0/WindowsTimeline.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - overwrite: True
