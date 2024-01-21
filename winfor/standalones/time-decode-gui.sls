# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool - Standalone executable GUI
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 7.0.2
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '7.0.2' %}
{% set hash = 'e4027ce0817774fbd15d1b315861231542c50c5d03eb30f457413818e706ea32' %}
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
