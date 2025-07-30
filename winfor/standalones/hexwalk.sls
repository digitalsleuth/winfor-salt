# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 1.9.1
# Notes: 

{% set inpath = salt["pillar.get"]("inpath", "C:\standalone") %}
{% set version = "1.9.1" %}
{% set hash = "93f4845b0f31229dac347b79926270be57c29aa3c8e763309a0dbba8fba525a9" %}
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
