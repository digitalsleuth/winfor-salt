# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 3.2
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.2' %} 
{% set hash = 'eaa27133e0520979873ba57ad651560a4cc2618373bd05450b23a84d32beafd0' %}

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

scrcpy-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\scrcpy\'
    - require:
      - archive: scrcpy-extract
      - file: scrcpy-folder-rename
