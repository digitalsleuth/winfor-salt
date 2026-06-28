# Name: WinDepends
# Website: https://github.com/hfiref0x/WinDepends
# Description: Rewrite of Dependency Walker
# Category: Executables
# Author: hfiref0x
# License: MIT License (https://github.com/hfiref0x/WinDepends/blob/master/LICENSE)
# Version: 1.0.0.2512
# Notes: In Beta

{% set version = '1.0.0.2512' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.dotnet10-desktop-runtime

windepends-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\windepends'
    - source: '{{ downloads }}\windepends\WinDepends_v{{ version }}_beta_snapshot.zip'
    - enforce_toplevel: False
    - overwrite: True
    - require:
      - sls: winfor.offline.packages.dotnet10-desktop-runtime

windepends-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinDepends.lnk'
    - target: '{{ inpath }}\windepends\WinDepends.exe'
    - force: True
    - working_dir: '{{ inpath }}\windepends\'
    - makedirs: True
    - require:
      - archive: windepends-extract-offline
