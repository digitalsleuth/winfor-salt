# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 3.3.4
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.3.4' %} 
{% set hash = 'd8a155b7c180b7ca4cdadd40712b8750b63f3aab48cb5b8a2a39ac2d0d4c5d38' %}

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
