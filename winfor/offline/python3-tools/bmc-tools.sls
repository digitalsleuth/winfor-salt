# Name: bmc-tools
# Website: https://github.com/ANSSI-FR/bmc-tools
# Description: Parse Bitmap Cache RDP files
# Category: Windows Analysis
# Author: ANSSI-FR
# License: CeCILL Free Software License Agreement v2.1 (https://github.com/ANSSI-FR/bmc-tools/blob/master/LICENCE.txt)
# Version: 3.05
# Notes:

{% set version = '3.05' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'bmc-tools-'~ version ~'.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\bmc-tools\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

bmc-tools-copy-offline:
  file.copy:
    - name: 'C:\Program Files\Python310\Scripts\bmc-tools.py'
    - source: '{{ downloads }}\bmc-tools\bmc-tools-{{ version }}.py'
    - skip_verify: True
    - makedirs: True

bmc-tools-shebang-offline:
  file.replace:
    - name: 'C:\Program Files\Python310\Scripts\bmc-tools.py'
    - pattern: '#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - count: 1
    - require:
      - file: bmc-tools-copy-offline
      - sls: winfor.offline.packages.python3

bmc-tools-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\bmc-tools.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\bmc-tools.py" %*'
    - require:
      - file: bmc-tools-copy-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
