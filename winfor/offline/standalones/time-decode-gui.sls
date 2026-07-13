# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool - Standalone executable GUI
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 10.4.0
# Notes:

{% set version = '10.4.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'time-decode-gui-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\time-decode\\' + pkg) %}

{% if exists %}

time-decode-gui-offline:
  file.managed:
    - name: '{{ inpath }}\time-decode\time-decode-gui.exe'
    - source: '{{ downloads }}\time-decode\time-decode-gui-{{ version }}.exe'
    - makedirs: True
    - skip_verify: True

time-decode-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Time Decode.lnk'
    - target: '{{ inpath }}\time-decode\time-decode-gui.exe'
    - force: True
    - working_dir: '{{ inpath }}\time-decode\'
    - makedirs: True
    - require:
      - file: time-decode-gui-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
