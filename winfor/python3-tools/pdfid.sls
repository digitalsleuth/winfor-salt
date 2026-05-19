# Name: pdfid
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: PDF Analysis Tool
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.2.10
# Notes: 

{% set version = '0.2.10' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set files = ['pdfid.py','pdfid.ini','plugin_embeddedfile.py','plugin_nameobfuscation.py','plugin_triage.py','plugin_list'] %}

include:
  - winfor.packages.python3

{% for file in files %}
pdfif-download-{{ file }}:
  file.managed:
    - name: '{{ inpath }}\pdfid\{{ file }}'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/{{ file }}
    - makedirs: True
    - skip_verify: True
{% endfor %}

pdfid-header:
  file.replace:
    - name: '{{ inpath }}\pdfid\pdfid.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - sls: winfor.packages.python3

pdfid-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pdfid.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\python.exe" {{ inpath }}\pdfid\pdfid.py %*'
    - require:
      - file: pdfid-header
