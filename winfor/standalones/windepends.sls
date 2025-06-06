# Name: WinDepends
# Website: https://github.com/hfiref0x/WinDepends
# Description: Rewrite of Dependency Walker
# Category: Executables
# Author: hfiref0x
# License: MIT License (https://github.com/hfiref0x/WinDepends/blob/master/LICENSE)
# Version: 1.0.0.2505
# Notes: In Beta

{% set version = '1.0.0.2505' %}
{% set snapshot = '2505' %}
{% set hash = '3ee5a624c510e52bc6b2c99b0d3a1cf6b3def2946179615f7534f495811c0f84' %}
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
