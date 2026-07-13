# Name: pdf-parser
# Website: https://github.com/didierstevens/didierstevensssuite
# Description: PDF document parser
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.7.14
# Notes: 

{% set version = '0.7.14' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'pdf-parser-'~ version ~'.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\pdf-parser\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

pdf-parser-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pdf-parser.py'
    - source: '{{ downloads }}\pdf-parser\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.python3

pdf-parser-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pdf-parser.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\pdf-parser.py" %*'
    - require:
      - sls: winfor.offline.packages.python3
      - file: pdf-parser-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
