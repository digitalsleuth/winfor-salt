# Name: TrID
# Website: https://mark0.net/soft-trid-e.html
# Description: File identifier based on their binary signatures
# Category: Executables
# Author: Marco Pontello
# License: Free for personal / non-commercial use
# Version: 2.2.4
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.2.4' %}
{% set trid_hash = 'ea7f82363912f5b3c79217ba8716425ec3f2514887f788dcd5a2821d0b1fc83f' %}
{% set update_hash = '3596167b5fa2f4adb3b6ee013c3f111a5c9e3b52f948e70e27423d8e69a1bb12' %}

trid-download-only:
  file.managed:
    - name: '{{ downloads }}\trid\trid_w32-{{ version }}.zip'
    - source: https://mark0.net/download/trid_w32.zip
    - source_hash: sha256={{ trid_hash }}
    - makedirs: True

trid-defs-download-only:
  file.managed:
    - name: '{{ downloads }}\trid\triddefs.zip'
    - source: https://mark0.net/download/triddefs.zip
    - skip_verify: True
    - makedirs: True

trid-update-download-only:
  file.managed:
    - name: '{{ downloads }}\trid\tridupdate.zip'
    - source: https://mark0.net/download/tridupdate.zip
    - source_hash: sha256={{ update_hash }}
    - makedirs: True
