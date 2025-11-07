# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.9.3
# Notes: 

{% set version = '0.0.9.3' %}
{% set hash = '15ad23914bf993541b746f83a6145fea5d80dad75960f2e634ee7d18b503a984' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exeinfope-download-only:
  file.managed:
    - name: '{{ downloads }}\exeinfope\exeinfope-{{ version }}.zip'
    - source: https://github.com/ExeinfoASL/ASL/raw/master/exeinfope.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
