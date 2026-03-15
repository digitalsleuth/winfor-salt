# Name: srum-dump
# Website: https://github.com/MarkBaggett/srum-dump
# Description: Tool to analyze data in the Windows System Resource Usage Monitor database
# Category: Windows Analysis
# Author: Mark Baggett
# License: GNU General Public License v3 (https://github.com/MarkBaggett/srum-dump/blob/master/LICENSE)
# Version: 3.2
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.2' %}
{% set hash = '43984652664baf21ebf44e660d70b59a61d38f36f8e4ff6dcd54640b24d7794a' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

srum-dump-download:
  file.managed:
    - name: '{{ inpath }}\srum-dump\srum-dump.exe'
    - source: https://github.com/MarkBaggett/srum-dump/releases/download/v{{ version }}/srum_dump.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

srum-dump-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\srum-dump\srum-dump.exe -OutPath {{ inpath }}\shims\srum-dump.exe'
    - require:
      - sls: winfor.config.shims

srum-dump-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SRUM-DUMP.lnk'
    - target: '{{ inpath }}\srum-dump\srum-dump.exe'
    - force: True
    - working_dir: '{{ inpath }}\srum-dump\'
    - makedirs: True
    - require:
      - file: srum-dump-download
