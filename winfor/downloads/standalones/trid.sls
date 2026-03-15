# Name: TrID
# Website: https://mark0.net/soft-trid-e.html
# Description: File identifier based on their binary signatures
# Category: Executables
# Author: Marco Pontello
# License: Free for personal / non-commercial use
# Version: 2.47
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.47' %}
{% set hash = '5683d49089d6f08312ad0736f47f212fbedd4a92af700eab34ee4b242e6060c3' %}

trid-download-only:
  file.managed:
    - name: '{{ downloads }}\trid\trid_win64-{{ version }}.zip'
    - source: https://mark0.net/download/trid_win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

trid-defs-download-only:
  file.managed:
    - name: '{{ downloads }}\trid\triddefs.zip'
    - source: https://mark0.net/download/triddefs.zip
    - skip_verify: True
    - makedirs: True
