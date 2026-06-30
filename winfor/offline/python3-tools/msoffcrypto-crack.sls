# Name: msoffcrypto-crack.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: MS Office Document Password Cracking utility
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.5
# Notes: 

{% set version = '0.0.5' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'msoffcrypto-crack-'~ version ~'.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\msoffcrypto-crack\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3
  - winfor.offline.python3-tools.msoffcrypto-tool

msoffcrypto-crack-file-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\msoffcrypto-crack.py'
    - source: '{{ downloads }}\msoffcrypto-crack\msoffcrypto-crack-{{ version }}.py'
    - skip_verify: True
    - makedirs: True
    - force: True
    - require:
      - sls: winfor.offline.packages.python3
      - sls: winfor.offline.python3-tools.msoffcrypto-tool

msoffcrypto-crack-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\msoffcrypto-crack.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\msoffcrypto-crack.py" %*'
    - require:
      - file: msoffcrypto-crack-file-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
