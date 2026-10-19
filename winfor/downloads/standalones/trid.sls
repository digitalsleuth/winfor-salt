# Name: TrID
# Website: https://mark0.net/soft-trid-e.html
# Description: File identifier based on their binary signatures
# Category: Executables
# Author: Marco Pontello
# License: Free for personal / non-commercial use
# Version: 2.48
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.48' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('trid') %}

trid-download-only:
  file.managed:
    - name: '{{ downloads }}\trid\trid-{{ version }}.zip'
    - source: https://mark0.net/download/trid_win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

trid-defs-download-only:
  file.managed:
    - name: '{{ downloads }}\trid\triddefs.zip'
    - source: https://mark0.net/download/triddefs.zip
    - skip_verify: True
    - makedirs: True
