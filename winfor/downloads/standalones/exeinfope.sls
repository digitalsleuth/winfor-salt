# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.1.0.0
# Notes: 

{% set version = '0.1.0.0' %}
{% set hash = '26cbdf8ff9e172018668c71c6884294a1a9619c48a64148b11db385779b13194' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exeinfope-download-only:
  file.managed:
    - name: '{{ downloads }}\exeinfope\exeinfope-{{ version }}.zip'
    - source: https://github.com/ExeinfoASL/ASL/releases/download/v{{ version }}/exeinfope.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
