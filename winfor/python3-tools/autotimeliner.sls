# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set hash = 'e4807cb89dcb71a4bb95364f314131511aeea65b49f1f378b6b64dca98a1806c' %}

include:
  - winfor.standalones.sleuthkit
  - winfor.python2-tools.volatility2

autotimeliner-download:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\autotimeliner.py'
    - source: https://github.com/andreafortuna/autotimeliner/raw/master/autotimeline.py
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.standalones.sleuthkit
      - sls: winfor.python2-tools.volatility2

autotimeliner-env:
  file.replace:
    - name: 'C:\Program Files\Python310\Scripts\autotimeliner.py'
    - pattern: '#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - count: 1
    - require:
      - file: autotimeliner-download

autotimeliner-vol-bin:
  file.replace:
    - name: 'C:\Program Files\Python310\Scripts\autotimeliner.py'
    - pattern: {{ 'VOLATILITYBIN = os.popen("which volatility || which vol.py").read().rstrip()' | regex_escape }}
    - repl: 'VOLATILITYBIN = "vol2"'
    - count: 1
    - require:
      - file: autotimeliner-download

autotimeliner-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\autotimeliner.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\autotimeliner.py" %*'
    - require:
      - file: autotimeliner-download
