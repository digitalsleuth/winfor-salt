# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 2.1.0
# Notes: 

{% set version = '2.1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '1ac88a0fd6c6b099aacd656128bdc7028b9b17780bc8d130b4d9723cef86b72d' %}
{% set PROGRAMDATA = salt["environ.get"]("PROGRAMDATA") %}

hexwalk-download:
  file.managed:
    - name: 'C:\salt\tempdownload\hexwalk_{{ version }}_Windows_X64.zip'
    - source: https://github.com/gcarmix/HexWalk/releases/download/v{{ version }}/hexwalk_{{ version }}_Windows_X64_portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

hexwalk-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\hexwalk_{{ version }}_Windows_X64.zip'
    - enforce_toplevel: False
    - require:
      - file: hexwalk-download

hexwalk-folder-copy:
  file.copy:
    - name: '{{ inpath }}\hexwalk'
    - source: '{{ inpath }}\hexwalk_{{ version }}_Windows_X64\hexwalk'
    - force: True
    - makedirs: True
    - recurse: True
    - win_inheritance: True
    - require:
      - archive: hexwalk-extract

hexwalk-original-folder-absent:
  file.absent:
    - name: '{{ inpath }}\hexwalk_{{ version }}_Windows_X64'
    - require:
      - file: hexwalk-folder-copy

hexwalk-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\HexWalk.lnk'
    - target: '{{ inpath }}\hexwalk\hexwalk.exe'
    - force: True
    - working_dir: '{{ inpath }}\hexwalk\'
    - makedirs: True
    - require:
      - file: hexwalk-download
      - archive: hexwalk-extract
