# Name: 1768.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: Cobalt Strike Beacon Analysis Tool
# Category: Raw Parsers / Decoders
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.23
# Notes:

{% set version = '0.0.23' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = '1768-'~ version ~'.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\1768\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

1768-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\1768.py'
    - source: '{{ downloads }}\1768\{{ pkg }}'
    - skip_verify: True
    - makedirs: True

1768-requirements-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages pefile peutils'
    - cwd: '{{ downloads }}\1768\'
    - require:
      - file: 1768-offline

1768-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\1768.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\1768.py" %*'
    - require:
      - file: 1768-offline
      - sls: winfor.offline.packages.python3
      - cmd: 1768-requirements-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
