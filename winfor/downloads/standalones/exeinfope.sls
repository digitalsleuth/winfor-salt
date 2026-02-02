# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.9.4
# Notes: 

{% set version = '0.0.9.4' %}
{% set hash = '4cdf3980c7db40ee27a8caf0781f8f311f662c27babab27948febb5668e34a14' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exeinfope-download-only:
  file.managed:
    - name: '{{ downloads }}\exeinfope\exeinfope-{{ version }}.zip'
    - source: https://github.com/ExeinfoASL/ASL/raw/master/exeinfope.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
