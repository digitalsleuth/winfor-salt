# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool - Standalone executable GUI
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 9.0.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '9.0.0' %}
{% set hash = '6892d17e0f04454651ddbdb3c61d8fd88e0dfc86194dc6fa997b8af8688fd40f' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

time-decode-download:
  file.managed:
    - name: '{{ inpath }}\time-decode\Time Decode GUI.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.GUI.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

time-decode-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Time Decode.lnk'
    - target: '{{ inpath }}\time-decode\Time Decode GUI.exe'
    - force: True
    - working_dir: '{{ inpath }}\time-decode\'
    - makedirs: True
    - require:
      - file: time-decode-download
