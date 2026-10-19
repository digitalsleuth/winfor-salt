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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('bmc-tools') %}

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
