# Name: srum-dump
# Website: https://github.com/MarkBaggett/srum-dump
# Description: Tool to analyze data in the Windows System Resource Usage Monitor database
# Category: Windows Analysis
# Author: Mark Baggett
# License: GNU General Public License v3 (https://github.com/MarkBaggett/srum-dump/blob/master/LICENSE)
# Version: 3.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.0' %}
{% set hash = 'bbb461a5d5445da91d93583586c638a9482204ccb896a54ddf6a86671d5d2399' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

srum-dump-download:
  file.managed:
    - name: '{{ inpath }}\srum-dump\srum-dump.exe'
    - source: https://github.com/MarkBaggett/srum-dump/releases/download/v{{ version }}/srum_dump.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

srum-dump-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\srum-dump\'

srum-dump-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SRUM-DUMP.lnk'
    - target: '{{ inpath }}\srum-dump\srum-dump.exe'
    - force: True
    - working_dir: '{{ inpath }}\srum-dump\'
    - makedirs: True
    - require:
      - file: srum-dump-download
