# Name: srum-dump
# Website: https://github.com/MarkBaggett/srum-dump
# Description: Tool to analyze data in the Windows System Resource Usage Monitor database
# Category: Windows Analysis
# Author: Mark Baggett
# License: GNU General Public License v3 (https://github.com/MarkBaggett/srum-dump/blob/master/LICENSE)
# Version: 2.5
# Notes: 

{% set version = '2.5' %}
{% set hash = '4441b528553d74408138c01f7c1a5086533f0b4933cf5741f9ac537f1b0fdce1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

srum-dump2-download-only:
  file.managed:
    - name: '{{ downloads }}\srum-dump\srum-dump2-{{ version }}.exe'
    - source: https://github.com/MarkBaggett/srum-dump/releases/download/{{ version }}/srum_dump2.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

srum-dump2-template-download-only:
  file.managed:
    - name: '{{ downloads }}\srum-dump\SRUM_TEMPLATE3.xlsx'
    - source: https://github.com/MarkBaggett/srum-dump/raw/master/SRUM_TEMPLATE3.xlsx
    - source_hash: sha256=af7c685832208d874dd8cba1580a0b28fe52b70b1a1ec3fe2a80390c2bc5a2b4
    - makedirs: True
    - require:
      - file: srum-dump2-download-only

srum-dump2-fget-download-only:
  file.managed:
    - name: '{{ downloads }}\srum-dump\FGET.exe'
    - source: https://github.com/MarkBaggett/srum-dump/raw/master/FGET.exe
    - source_hash: sha256=5958EAC46F9F9AF578E72B8073F000910D8A4A1C7D362D744F077D78C4024547
    - makedirs: True
    - require:
      - file: srum-dump2-download-only
