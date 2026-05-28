# Name: oledump.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: Analyze OLE files
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.85
# Notes: 

{% set version = '0.0.85' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3
  - winfor.offline.python3-tools.olefile

oledump-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\oledump'
    - source: '{{ downloads }}\oledump'
    - makedirs: True
    - force: True

oledump-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\oledump.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\python.exe" {{ inpath }}\oledump\oledump.py %*'
    - require:
      - sls: winfor.offline.packages.python3
      - sls: winfor.offline.python3-tools.olefile
