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
{% set hash = '38aed900f5fe0c9272e66451266ab6888401b95c50920eff268bbbba4db4b040' %}

include:
  - winfor.packages.python3

1768-download:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\1768.py'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/refs/heads/master/1768.py
    - source_hash: sha256={{ hash }}
    - makedirs: True

1768-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\1768.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\1768.py" %*'
    - require:
      - file: 1768-download
      - sls: winfor.packages.python3

1768-requirements:
  pip.installed:
    - names:
      - pefile
      - peutils
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
      - file: 1768-download
