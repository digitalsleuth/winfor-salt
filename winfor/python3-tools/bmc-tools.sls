# Name: bmc-tools
# Website: https://github.com/ANSSI-FR/bmc-tools
# Description: Parse Bitmap Cache RDP files
# Category: Windows Analysis
# Author: ANSSI-FR
# License: CeCILL Free Software License Agreement v2.1 (https://github.com/ANSSI-FR/bmc-tools/blob/master/LICENCE.txt)
# Version: 3.00
# Notes:

{% set hash = '6FF3C428B36E236D0EF621B02FDF25564D0B36BFEEC1FEB55AED243534FD8A6F' %}

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

bmc-tools-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\bmc-tools.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\bmc-tools.py" %*'
    - require:
      - file: bmc-tools-download
