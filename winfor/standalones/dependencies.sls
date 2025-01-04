# Name: Dependencies
# Website: https://github.com/lucasg/dependencies
# Description: Rewrite of original "depends.exe"
# Category: Executables
# Author: lucasg
# License: MIT License (https://github.com/lucasg/Dependencies/blob/master/LICENSE)
# Version: 1.11.1
# Notes: 

{% set version = '1.11.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '7d22dc00f1c09fd4415d48ad74d1cf801893e83b9a39944b0fce6dea7ceaea99' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.ms-vcpp-2017-redist-x64

dependencies-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Dependencies_x64_Release.zip'
    - source: https://github.com/lucasg/Dependencies/releases/download/v{{ version }}/Dependencies_x64_Release.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

dependencies-extract:
  archive.extracted:
    - name: '{{ inpath }}\dependencies'
    - source: 'C:\salt\tempdownload\Dependencies_x64_Release.zip'
    - enforce_toplevel: False
    - require:
      - file: dependencies-download
      - sls: winfor.packages.ms-vcpp-2017-redist-x64

dependencies-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Dependencies GUI.lnk'
    - target: '{{ inpath }}\dependencies\DependenciesGui.exe'
    - force: True
    - working_dir: '{{ inpath }}\dependencies\'
    - makedirs: True
    - require:
      - archive: dependencies-extract

dependencies-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\dependencies'
    - require:
      - archive: dependencies-extract
