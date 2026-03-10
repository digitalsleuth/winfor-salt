# Name: Windexter
# Website: https://github.com/digitalsleuth/windexter
# Description: A Windows Search Index parser, written in C#
# Category: Windows Analysis
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/windexter/blob/main/LICENSE)
# Version: 1.0.2
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.0.2' %}
{% set hash = '9b0340bb04b6e37101cbf0ec413b26208b46b2f4450b97a34bce59aa239ec60e' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

windexter-download:
  file.managed:
    - name: '{{ inpath }}\windexter\Windexter.exe'
    - source: https://github.com/digitalsleuth/windexter/releases/download/v{{ version }}/Windexter-v{{ version }}.0.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

windexter-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Windexter.lnk'
    - target: '{{ inpath }}\windexter\Windexter.exe'
    - force: True
    - working_dir: '{{ inpath }}\windexter\'
    - makedirs: True
    - require:
      - file: windexter-download
