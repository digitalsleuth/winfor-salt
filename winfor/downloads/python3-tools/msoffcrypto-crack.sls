# Name: msoffcrypto-crack.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: MS Office Document Password Cracking utility
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.5
# Notes:

{% set version = '0.0.5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('msoffcrypto-crack') %}

include:
  - winfor.downloads.python3-tools.msoffcrypto-tool

msoffcrypto-crack-download-only:
  file.managed:
    - name: '{{ downloads }}\msoffcrypto-crack\msoffcrypto-crack-{{ version }}.py'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/msoffcrypto-crack.py
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.python3-tools.msoffcrypto-tool

msoffcrypto-crack-header-download-only:
  file.replace:
    - name: '{{ downloads }}\msoffcrypto-crack\msoffcrypto-crack-{{ version }}.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - file: msoffcrypto-crack-download-only
