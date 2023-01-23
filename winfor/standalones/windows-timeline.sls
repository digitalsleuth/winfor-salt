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
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

windowstimeline-download:
  file.managed:
    - name: '{{ inpath }}\windowstimeline\WindowsTimeline.exe'
    - source: https://github.com/kacos2000/WindowsTimeline/releases/download/v.2.0.81.0/WindowsTimeline.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - overwrite: True

windowstimeline-env:
  win_path.exists:
    - name: '{{ inpath }}\windowstimeline\'

windowstimeline-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Windows Timeline.lnk'
    - target: '{{ inpath }}\windowstimeline\WindowsTimeline.exe'
    - force: True
    - working_dir: '{{ inpath }}\windowstimeline\'
    - makedirs: True
    - require:
      - file: windowstimeline-download
