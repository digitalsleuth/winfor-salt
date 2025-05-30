# Name: Total PE 2
# Website: https://github.com/zodiacon/TotalPE2
# Description: PE Viewer
# Category: Executables
# Author: Pavel Yosifovich
# License: MIT License (https://github.com/zodiacon/TotalPE2/blob/master/LICENSE.txt)
# Version: 0.6.5.1
# Notes: 

{% set version = '0.6.5.1' %}
{% set hash = '265bf06eb5e14e5ee2e2a2b261215b914f3885fe543873a1c97795decd89e03e' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

total-pe-2:
  file.managed:
    - name: '{{ inpath }}\total-pe-2\TotalPE.exe'
    - source: https://github.com/zodiacon/AllTools/raw/master/TotalPE.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

total-pe-2-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Total PE 2.lnk'
    - target: {{ inpath }}\total-pe-2\TotalPE.exe
    - force: True
    - working_dir: {{ inpath }}\total-pe-2\
    - makedirs: True
    - require:
      - file: total-pe-2
