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
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.ms-vcpp-2017-redist-x64
  - winfor.config.shims

dependencies-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\dependencies'
    - source: '{{ downloads }}\dependencies\Dependencies_x64_Release-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - sls: winfor.offline.packages.ms-vcpp-2017-redist-x64

dependencies-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Dependencies GUI.lnk'
    - target: '{{ inpath }}\dependencies\DependenciesGui.exe'
    - force: True
    - working_dir: '{{ inpath }}\dependencies\'
    - makedirs: True
    - require:
      - archive: dependencies-extract-offline

dependencies-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\dependencies\Dependencies.exe -OutPath {{ inpath }}\shims\dependencies.exe'
    - require:
      - sls: winfor.config.shims
      - archive: dependencies-extract-offline
