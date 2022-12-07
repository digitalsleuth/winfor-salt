# Name: pdf-parser
# Website: https://github.com/didierstevens/didierstevensssuite
# Description: PDF document parser
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.7.7
# Notes: 

include:
  - winfor.packages.python3

pdf-parser-download:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pdf-parser.py'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/pdf-parser.py
    - source_hash: sha256=15bcd120bd4622b1a388d3d6f18c1c3b960484807d6a18a8c50082bc6a523663
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
