# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 1.10.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = "1.10.0" %}
{% set PROGRAMDATA = salt["environ.get"]("PROGRAMDATA") %}

hexwalk-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\hexwalk\hexwalk_{{ version }}_Windows_X64.zip'
    - enforce_toplevel: False

hexwalk-folder-copy-offline:
  file.copy:
    - name: '{{ inpath }}\hexwalk'
    - source: '{{ inpath }}\hexwalk_{{ version }}_Windows_X64\hexwalk'
    - force: True
    - makedirs: True
    - recurse: True
    - win_inheritance: True
    - require:
      - archive: hexwalk-extract-offline

hexwalk-original-folder-absent-offline:
  file.absent:
    - name: '{{ inpath }}\hexwalk_{{ version }}_Windows_X64'
    - require:
      - file: hexwalk-folder-copy-offline

hexwalk-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\HexWalk.lnk'
    - target: '{{ inpath }}\hexwalk\hexwalk.exe'
    - force: True
    - working_dir: '{{ inpath }}\hexwalk\'
    - makedirs: True
    - require:
      - archive: hexwalk-extract-offline
