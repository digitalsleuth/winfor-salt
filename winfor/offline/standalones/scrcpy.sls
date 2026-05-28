# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 3.3.4
# Notes:

{% set version = '3.3.4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

scrcpy-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\scrcpy\scrcpy-win64-v{{ version }}.zip'
    - enforce_toplevel: False

scrcpy-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\scrcpy'
    - source: '{{ inpath }}\scrcpy-win64-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: scrcpy-extract-offline

scrcpy-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\scrcpy\scrcpy.exe -OutPath {{ inpath }}\shims\scrcpy.exe'
    - require:
      - sls: winfor.config.shims
