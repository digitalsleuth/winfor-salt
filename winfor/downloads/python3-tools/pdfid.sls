# Name: pdfid
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: PDF Analysis Tool
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.2.10
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = ['pdfid.py','pdfid.ini','plugin_embeddedfile.py','plugin_nameobfuscation.py','plugin_triage.py','plugin_list'] %}

include:
  - winfor.downloads.packages.python3

{% for file in files %}
pdfif-download-{{ file }}-download-only:
  file.managed:
    - name: '{{ downloads }}\pdfid\{{ file }}'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/{{ file }}
    - makedirs: True
    - skip_verify: True
{% endfor %}

pdfid-header-download-only:
  file.replace:
    - name: '{{ downloads }}\pdfid\pdfid.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - sls: winfor.downloads.packages.python3
