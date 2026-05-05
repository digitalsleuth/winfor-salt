# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 1.10.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = "1.10.0" %}
{% set hash = '60987a9f2003ed8955c90ae2157a60dc3bb39758431edff1cc4265dbd069850a' %}
{% set PROGRAMDATA = salt["environ.get"]("PROGRAMDATA") %}

hexwalk-download:
  file.managed:
    - name: 'C:\salt\tempdownload\hexwalk_{{ version }}_Windows_X64.zip'
    - source: https://github.com/gcarmix/HexWalk/releases/download/v{{ version }}/hexwalk_{{ version }}_Windows_X64.zip
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
