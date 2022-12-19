# Name: srum-dump
# Website: https://github.com/MarkBaggett/srum-dump
# Description: Tool to analyze data in the Windows System Resource Usage Monitor database
# Category: Windows Analysis
# Author: Mark Baggett
# License: GNU General Public License v3 (https://github.com/MarkBaggett/srum-dump/blob/master/LICENSE)
# Version: 2.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.4' %}
{% set hash = '2DA7F478429583E60176D9028FA0CB8E2FE32A6C6F25572ED1CDEBA2F3767C34' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

srum-dump2-download:
  file.managed:
    - name: '{{ inpath }}\srum-dump2\srum-dump2.exe'
    - source: https://github.com/MarkBaggett/srum-dump/releases/download/{{ version }}/srum_dump2.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

srum-dump2-template-download:
  file.managed:
    - name: '{{ inpath }}\srum-dump2\SRUM_TEMPLATE2.xlsx'
    - source: https://github.com/MarkBaggett/srum-dump/raw/master/SRUM_TEMPLATE2.xlsx
    - source_hash: sha256=66dc9a5e9ca74e7d36a25caf6d3437ba06a4acaa6952947b90829d45523a64e2
    - makedirs: True
    - require:
      - file: srum-dump2-download

srum-dump2-fget-download:
  file.managed:
    - name: '{{ inpath }}\srum-dump2\FGET.exe'
    - source: https://github.com/MarkBaggett/srum-dump/raw/master/FGET.exe
    - source_hash: sha256=5958EAC46F9F9AF578E72B8073F000910D8A4A1C7D362D744F077D78C4024547
    - makedirs: True
    - require:
      - file: srum-dump2-download

srum-dump2-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\srum-dump2\'

winfor-standalones-srum-dump2-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SRUM-DUMP2.lnk'
    - target: '{{ inpath }}\srum-dump2\srum-dump2.exe'
    - force: True
    - working_dir: '{{ inpath }}\srum-dump2\'
    - makedirs: True
    - require:
      - file: srum-dump2-download
      - file: srum-dump2-template-download
