# Name: bmc-tools
# Website: https://github.com/ANSSI-FR/bmc-tools
# Description: Parse Bitmap Cache RDP files
# Category: Windows Analysis
# Author: ANSSI-FR
# License: CeCILL Free Software License Agreement v2.1 (https://github.com/ANSSI-FR/bmc-tools/blob/master/LICENCE.txt)
# Version: 3.05
# Notes:

{% set version = '3.05' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '4f2453a968e0d0dc66dc0afdb2e79c1af36bfdbae5a06e3c8c89a616ad82ca92' %}

bmc-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\bmc-tools\bmc-tools-{{ version }}.py'
    - source: https://github.com/ANSSI-FR/bmc-tools/raw/master/bmc-tools.py
    - source_hash: sha256={{ hash }}
    - makedirs: True

bmc-tools-env-download-only:
  file.replace:
    - name: '{{ downloads }}\bmc-tools\bmc-tools-{{ version }}.py'
    - pattern: '#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - count: 1
    - require:
      - file: bmc-tools-download-only
