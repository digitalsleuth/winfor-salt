# Name: Windows Timeline
# Website: https://github.com/kacos2000/WindowsTimeline
# Description: Windows Timeline / Activities Cache parser
# Category: Windows Analysis
# Author: Costas K.
# License: Mozilla Public License v2.0 (https://github.com/kacos2000/WindowsTimeline/blob/master/LICENSE)
# Version: 2.0.82.0
# Notes:

{% set version = '2.0.82.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'windowstimeline-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\windowstimeline\\' + pkg) %}

{% if exists %}

windowstimeline-offline:
  file.managed:
    - name: '{{ inpath }}\windowstimeline\WindowsTimeline.exe'
    - source: '{{ downloads }}\windowstimeline\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - overwrite: True

windowstimeline-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Windows Timeline.lnk'
    - target: '{{ inpath }}\windowstimeline\WindowsTimeline.exe'
    - force: True
    - working_dir: '{{ inpath }}\windowstimeline\'
    - makedirs: True
    - require:
      - file: windowstimeline-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}