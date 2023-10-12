# Name: oledump.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: Analyze OLE files
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.75
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set files = ['contains_pe_file.yara','plugin_msg.py','plugin_vba_dco.py','decoder_add1.py',
                'plugin_biff.py','plugin_msg_summary.py','plugin_vbaproject.py','decoder_ah.py',
                'plugin_clsid.py','plugin_msi.py','plugin_vba.py','decoder_chr.py','plugin_dridex.py',
                'plugin_office_crypto.py','plugin_vba_routines.py','decoder_rol1.py','plugin_hifo.py',
                'plugin_ppt.py','plugin_vba_summary.py','decoder_xor1.py','plugin_http_heuristics.py',
                'plugin_stream_o.py','plugin_version_vba.py','maldoc.yara','plugin_jumplist.py',
                'plugin_stream_sample.py','vba.yara','oledump.py','plugin_linear.py','plugin_str_sub.py'
               ] %}

include:
  - winfor.packages.python3
  - winfor.python3-tools.olefile

{% for file in files %}
oledump-download-{{ file }}:
  file.managed:
    - name: '{{ inpath }}\oledump\{{ file }}'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/{{ file }}
    - makedirs: True
    - skip_verify: True
{% endfor %}

oledump-header:
  file.replace:
    - name: '{{ inpath }}\oledump\oledump.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - sls: winfor.packages.python3
      - sls: winfor.python3-tools.olefile

oledump-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\oledump\'

oledump-wrapper:
  file.managed:
    - name: '{{ inpath }}\oledump\oledump.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\python.exe" {{ inpath }}\oledump\oledump.py %*'
    - require:
      - file: oledump-header
      - win_path: oledump-env-vars
