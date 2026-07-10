# Name: Total PE 2
# Website: https://github.com/zodiacon/TotalPE2
# Description: PE Viewer
# Category: Executables
# Author: Pavel Yosifovich
# License: MIT License (https://github.com/zodiacon/TotalPE2/blob/master/LICENSE.txt)
# Version: 0.7.0.0
# Notes: 

{% set version = '0.7.0.0' %}
{% set hash = 'c415eb0b99a47f9ddddc4c6ed58abe2802d4bdb8505d452d008f165fdf897750' %}
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
    - target: '{{ inpath }}\total-pe-2\TotalPE.exe'
    - force: True
    - working_dir: '{{ inpath }}\total-pe-2\'
    - makedirs: True
    - require:
      - file: total-pe-2
