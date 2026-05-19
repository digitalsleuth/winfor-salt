# Name: pdf-parser
# Website: https://github.com/didierstevens/didierstevensssuite
# Description: PDF document parser
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.7.14
# Notes: 

{% set version = '0.7.14' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'a9fa2faa25e88ab0293543d14aa168ff21fc9fd25a0a8ad657b0dad3171214ac' %}

include:
  - winfor.downloads.packages.python3

pdf-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\pdf-parser\pdf-parser-{{ version }}.py'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/pdf-parser.py
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.python3

pdf-parser-header-download-only:
  file.replace:
    - name: '{{ downloads }}\pdf-parser\pdf-parser-{{ version }}.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - sls: winfor.downloads.packages.python3
