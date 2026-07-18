# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.9.8
# Notes: 

{% set version = '0.0.9.8' %}
{% set hash = 'b14852e681b1880b0e5d694870af85b88e72976c82b07227198d5e70eef36881' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exeinfope-download-only:
  file.managed:
    - name: '{{ downloads }}\exeinfope\exeinfope-{{ version }}.zip'
    - source: https://github.com/ExeinfoASL/ASL/releases/download/v{{ version }}/exeinfope.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
