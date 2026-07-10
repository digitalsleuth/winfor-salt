# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 4.0
# Notes:

{% set version = '4.0' %} 
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '75dbeb5b00e6f64292f26f70900ae55ca397786bdfb0b9bbeb481a0549047457' %}

include:
  - winfor.config.shims

scrcpy-download:
  file.managed:
    - name: 'C:\salt\tempdownload\scrcpy-win64-v{{ version }}.zip'
    - source: https://github.com/Genymobile/scrcpy/releases/download/v{{ version }}/scrcpy-win64-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

scrcpy-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\scrcpy-win64-v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: scrcpy-download

scrcpy-folder-rename:
  file.rename:
    - name: '{{ inpath }}\scrcpy'
    - source: '{{ inpath }}\scrcpy-win64-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: scrcpy-extract

scrcpy-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\scrcpy\scrcpy.exe -OutPath {{ inpath }}\shims\scrcpy.exe'
    - require:
      - sls: winfor.config.shims
