# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool - Standalone executable GUI
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 10.1.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '10.1.0' %}
{% set hash = 'c360294d9a26323767bfd98c716a43e9aba8fdaa1295eca1531477619fd0f176' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

time-decode-download:
  file.managed:
    - name: '{{ inpath }}\time-decode\Time Decode.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

time-decode-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Time Decode.lnk'
    - target: '{{ inpath }}\time-decode\Time Decode.exe'
    - force: True
    - working_dir: '{{ inpath }}\time-decode\'
    - makedirs: True
    - require:
      - file: time-decode-download
