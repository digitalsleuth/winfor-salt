# Name: rtfdump.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: Analyze RTF files
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.15
# Notes:

{% set version = '0.0.15' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = ['rtfdump.py','rtf.yara'] %}

include:
  - winfor.downloads.packages.python3
  - winfor.downloads.python3-tools.yara-python

{% for file in files %}
rtfdump-{{ file }}-download-only:
  file.managed:
    - name: '{{ downloads }}\rtfdump\{{ file }}'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/{{ file }}
    - makedirs: True
    - skip_verify: True
{% endfor %}

rtfdump-header-download-only:
  file.replace:
    - name: '{{ downloads }}\rtfdump\rtfdump.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - sls: winfor.downloads.packages.python3
      - sls: winfor.downloads.python3-tools.yara-python
