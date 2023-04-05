# Name: TrID
# Website: https://mark0.net/soft-trid-e.html
# Description: File identifier based on their binary signatures
# Category: Executables
# Author: Marco Pontello
# License: Free for personal / non-commercial use
# Version: 2.2.4
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.2.4' %}
{% set trid_hash = 'ea7f82363912f5b3c79217ba8716425ec3f2514887f788dcd5a2821d0b1fc83f' %}
{% set update_hash = '3596167b5fa2f4adb3b6ee013c3f111a5c9e3b52f948e70e27423d8e69a1bb12' %}

trid-download:
  file.managed:
    - name: 'C:\salt\tempdownload\trid_w32.zip'
    - source: https://mark0.net/download/trid_w32.zip
    - source_hash: sha256={{ trid_hash }}
    - makedirs: True

trid-defs-download:
  file.managed:
    - name: 'C:\salt\tempdownload\triddefs.zip'
    - source: https://mark0.net/download/triddefs.zip
    - skip_verify: True
    - makedirs: True

trid-update-download:
  file.managed:
    - name: 'C:\salt\tempdownload\tridupdate.zip'
    - source: https://mark0.net/download/tridupdate.zip
    - source_hash: sha256={{ update_hash }}
    - makedirs: True

trid-extract:
  archive.extracted:
    - name: '{{ inpath }}\trid'
    - source: 'C:\salt\tempdownload\trid_w32.zip'
    - enforce_toplevel: False
    - require:
      - file: trid-download

trid-defs-extract:
  archive.extracted:
    - name: '{{ inpath }}\trid'
    - source: 'C:\salt\tempdownload\triddefs.zip'
    - enforce_toplevel: False
    - require:
      - file: trid-defs-download

trid-update-extract:
  archive.extracted:
    - name: '{{ inpath }}\trid'
    - source: 'C:\salt\tempdownload\tridupdate.zip'
    - enforce_toplevel: False
    - require:
      - file: trid-update-download

trid-update-header:
  file.replace:
    - name: '{{ inpath }}\trid\tridupdate.py'
    - pattern: '^#!/usr/bin/env python$'
    - repl: '#!/usr/bin/python3'
    - backup: False
    - prepend_if_not_found: False
    - count: 1
    - require:
      - archive: trid-update-extract

trid-env:
  win_path.exists:
    - name: '{{ inpath }}\trid'
