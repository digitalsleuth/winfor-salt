# Name: oledump.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: Analyze OLE files
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.85
# Notes: 

{% set version = '0.0.85' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = ['contains_pe_file.yara','plugin_msg.py','plugin_vba_dco.py','decoder_add1.py',
                'plugin_biff.py','plugin_msg_summary.py','plugin_vbaproject.py','decoder_ah.py',
                'plugin_clsid.py','plugin_msi.py','plugin_vba.py','decoder_chr.py','plugin_dridex.py',
                'plugin_office_crypto.py','plugin_vba_routines.py','decoder_rol1.py','plugin_hifo.py',
                'plugin_ppt.py','plugin_vba_summary.py','decoder_xor1.py','plugin_http_heuristics.py',
                'plugin_stream_o.py','plugin_version_vba.py','maldoc.yara','plugin_jumplist.py',
                'plugin_stream_sample.py','vba.yara','oledump.py','plugin_linear.py','plugin_str_sub.py',
                'plugin_hyperlink.py', 'plugin_metadata.py', 'plugin_msi_info.py', 'plugin_olestreams.py',
                'plugin_ooxml_url.py', 'plugin_vba_dir.py'
               ] %}

include:
  - winfor.downloads.packages.python3
  - winfor.downloads.python3-tools.olefile

{% for file in files %}
oledump-download-{{ file }}-download-only:
  file.managed:
    - name: '{{ downloads }}\oledump\{{ file }}'
    - source: https://github.com/DidierStevens/DidierStevensSuite/raw/master/{{ file }}
    - makedirs: True
    - skip_verify: True
{% endfor %}

oledump-header-download-only:
  file.replace:
    - name: '{{ downloads }}\oledump\oledump.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - sls: winfor.downloads.packages.python3
      - sls: winfor.downloads.python3-tools.olefile
