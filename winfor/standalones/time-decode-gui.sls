# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool - Standalone executable GUI
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 8.0.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '8.0.0' %}
{% set hash = '4cd6a043259720fca2151a8db1bb71de90c3f5f5e3f974846ef79ea6f66f3dd4' %}
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
