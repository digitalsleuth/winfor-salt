# Name: bmc-tools
# Website: https://github.com/ANSSI-FR/bmc-tools
# Description: Parse Bitmap Cache RDP files
# Category: Windows Analysis
# Author: ANSSI-FR
# License: CeCILL Free Software License Agreement v2.1 (https://github.com/ANSSI-FR/bmc-tools/blob/master/LICENCE.txt)
# Version: 3.04
# Notes:

{% set hash = 'a28367c083ee77378130964e9fa7fbc9ce0c1a5cbc29f983fe1f02af9b0fd089' %}
{% set version = '3.04' %}

include:
  - winfor.packages.python3

bmc-tools-download:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\bmc-tools.py'
    - source: https://github.com/ANSSI-FR/bmc-tools/raw/master/bmc-tools.py
    - source_hash: sha256={{ hash }}
    - makedirs: True

bmc-tools-env:
  file.replace:
    - name: 'C:\Program Files\Python310\Scripts\bmc-tools.py'
    - pattern: '#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - count: 1
    - require:
      - file: bmc-tools-download
      - sls: winfor.packages.python3

bmc-tools-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\bmc-tools.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\bmc-tools.py" %*'
    - require:
      - file: bmc-tools-download
