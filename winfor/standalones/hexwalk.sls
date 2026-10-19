# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 2.2.1
# Notes: 

{% set version = '2.2.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'd8c5aa6c8c918f3aab19f6e2b756c903df512542572b91eeef897b97e33a21f9' %}
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
