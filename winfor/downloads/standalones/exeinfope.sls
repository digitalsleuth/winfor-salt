# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.9.9
# Notes: 

{% set version = '0.0.9.9' %}
{% set hash = '6a0d8c0930a58dd3e070993f3d92136deb9f912935888a40268bfe7fd00e4ef2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exeinfope-download-only:
  file.managed:
    - name: '{{ downloads }}\exeinfope\exeinfope-{{ version }}.zip'
    - source: https://github.com/ExeinfoASL/ASL/releases/download/v{{ version }}/exeinfope.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
