# Name: msoffcrypto-crack.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: MS Office Document Password Cracking utility
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.5
# Notes: 

include:
  - winfor.packages.python3
  - winfor.python3-tools.msoffcrypto-tool

msoffcrypto-crack-download:
  file.managed:
    - name: 'C:\standalone\msoffcrypto-crack\msoffcrypto-crack.py'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/msoffcrypto-crack.py
    - source_hash: sha256=f0a78b7263704d8740a7d4738a8b3d5cfc6037de619953b444a0019551826367
    - makedirs: True
    - require:
      - sls: winfor.packages.python3
      - sls: winfor.python3-tools.msoffcrypto-tool

msoffcrypto-crack-header:
  file.replace:
    - name: 'C:\standalone\msoffcrypto-crack\msoffcrypto-crack.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - file: msoffcrypto-crack-download

msoffcrypto-crack-env-vars:
  win_path.exists:
    - name: 'C:\standalone\msoffcrypto-crack\'

msoffcrypto-crack-wrapper:
  file.managed:
    - name: 'C:\standalone\msoffcrypto-crack\msoffcrypto-crack.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\python.exe" C:\standalone\msoffcrypto-crack\msoffcrypto-crack.py %*'
    - require:
      - file: msoffcrypto-crack-header
      - win_path: msoffcrypto-crack-env-vars
