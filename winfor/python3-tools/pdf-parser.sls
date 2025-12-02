# Name: pdf-parser
# Website: https://github.com/didierstevens/didierstevensssuite
# Description: PDF document parser
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.7.13
# Notes: 

{% set version = '0.7.13' %}
{% set hash = '628256f0c016347a6b838729499397106a89b327965b7d7f77e47c1be0bc603f' %}

include:
  - winfor.packages.python3

pdf-parser-download:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pdf-parser.py'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/pdf-parser.py
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.python3

pdf-parser-header:
  file.replace:
    - name: 'C:\Program Files\Python310\Scripts\pdf-parser.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - sls: winfor.packages.python3

python3-pdf-parser-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pdf-parser.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\pdf-parser.py" %*'
