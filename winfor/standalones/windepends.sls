# Name: WinDepends
# Website: https://github.com/hfiref0x/WinDepends
# Description: Rewrite of Dependency Walker
# Category: Executables
# Author: hfiref0x
# License: MIT License (https://github.com/hfiref0x/WinDepends/blob/master/LICENSE)
# Version: 1.0.0.2504
# Notes: In Beta

{% set version = '1.0.0.2504' %}
{% set snapshot = '2504' %}
{% set hash = '55edc345c9bedfa03b99b21f17c3b357c5c9b526ade9ee61e540f0f4925057fa' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.dotnet8-desktop-runtime

windepends-download:
  file.managed:
    - name: 'C:\salt\tempdownload\WinDepends_v{{ version }}_beta_snapshot.zip'
    - source: https://github.com/hfiref0x/WinDepends/releases/download/{{ snapshot }}-beta/WinDepends_v{{ version }}_beta_snapshot.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

windepends-extract:
  archive.extracted:
    - name: '{{ inpath }}\windepends'
    - source: 'C:\salt\tempdownload\WinDepends_v{{ version }}_beta_snapshot.zip'
    - enforce_toplevel: False
    - overwrite: True
    - require:
      - file: windepends-download
      - sls: winfor.packages.dotnet8-desktop-runtime

windepends-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinDepends.lnk'
    - target: '{{ inpath }}\windepends\WinDepends.exe'
    - force: True
    - working_dir: '{{ inpath }}\windepends\'
    - makedirs: True
    - require:
      - archive: windepends-extract
