# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.8.8
# Notes: 

{% set version = '0.0.8.8' %}
{% set hash = '9566d3fcfc6a5e1b67b5cbefadb10585ffb43101ffe01f778cb0af11ce046620' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exeinfope-download-only:
  file.managed:
    - name: '{{ downloads }}\exeinfope\exeinfope-{{ version }}.zip'
    - source: https://github.com/ExeinfoASL/ASL/raw/master/exeinfope.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
