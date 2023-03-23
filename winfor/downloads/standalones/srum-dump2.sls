# Name: srum-dump
# Website: https://github.com/MarkBaggett/srum-dump
# Description: Tool to analyze data in the Windows System Resource Usage Monitor database
# Category: Windows Analysis
# Author: Mark Baggett
# License: GNU General Public License v3 (https://github.com/MarkBaggett/srum-dump/blob/master/LICENSE)
# Version: 2.4
# Notes: 

{% set version = '2.4' %}
{% set hash = '2DA7F478429583E60176D9028FA0CB8E2FE32A6C6F25572ED1CDEBA2F3767C34' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

srum-dump2-download-only:
  file.managed:
    - name: '{{ downloads }}\srum-dump2.exe'
    - source: https://github.com/MarkBaggett/srum-dump/releases/download/{{ version }}/srum_dump2.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

srum-dump2-template-download-only:
  file.managed:
    - name: '{{ downloads }}\SRUM_TEMPLATE2.xlsx'
    - source: https://github.com/MarkBaggett/srum-dump/raw/master/SRUM_TEMPLATE2.xlsx
    - source_hash: sha256=66dc9a5e9ca74e7d36a25caf6d3437ba06a4acaa6952947b90829d45523a64e2
    - makedirs: True
    - require:
      - file: srum-dump2-download-only

srum-dump2-fget-download-only:
  file.managed:
    - name: '{{ downloads }}\FGET.exe'
    - source: https://github.com/MarkBaggett/srum-dump/raw/master/FGET.exe
    - source_hash: sha256=5958EAC46F9F9AF578E72B8073F000910D8A4A1C7D362D744F077D78C4024547
    - makedirs: True
    - require:
      - file: srum-dump2-download-only
