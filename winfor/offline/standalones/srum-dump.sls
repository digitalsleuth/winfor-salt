# Name: srum-dump
# Website: https://github.com/MarkBaggett/srum-dump
# Description: Tool to analyze data in the Windows System Resource Usage Monitor database
# Category: Windows Analysis
# Author: Mark Baggett
# License: GNU General Public License v3 (https://github.com/MarkBaggett/srum-dump/blob/master/LICENSE)
# Version: 3.2
# Notes: 

{% set version = '3.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

srum-dump-copy-offline:
  file.copy:
    - name: '{{ inpath }}\srum-dump\srum-dump.exe'
    - source: '{{ downloads }}\srum-dump\srum-dump-{{ version }}.exe'
    - makedirs: True
    - force: True

srum-dump-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\srum-dump\srum-dump.exe -OutPath {{ inpath }}\shims\srum-dump.exe'
    - require:
      - sls: winfor.config.shims
      - file: srum-dump-copy-offline

srum-dump-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SRUM-DUMP.lnk'
    - target: '{{ inpath }}\srum-dump\srum-dump.exe'
    - force: True
    - working_dir: '{{ inpath }}\srum-dump\'
    - makedirs: True
    - require:
      - file: srum-dump-copy-offline
