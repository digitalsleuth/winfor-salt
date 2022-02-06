# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

srum-dump2-download:
  file.managed:
    - name: 'C:\standalone\srum-dump2\srum-dump2.exe'
    - source: https://github.com/MarkBaggett/srum-dump/releases/download/2.3/srum_dump2.exe
    - source_hash: sha256=a823b413565338a205623da6e4a6e065a908a345cc4ef31f3cb1d28dd1ddee7b
    - makedirs: True

srum-dump2-template-download:
  file.managed:
    - name: 'C:\standalone\srum-dump2\SRUM_TEMPLATE2.xlsx'
    - source: https://github.com/MarkBaggett/srum-dump/raw/master/SRUM_TEMPLATE2.xlsx
    - source_hash: sha256=66dc9a5e9ca74e7d36a25caf6d3437ba06a4acaa6952947b90829d45523a64e2
    - makedirs: True
    - require:
      - file: srum-dump2-download

srum-dump2-env-vars:
  win_path.exists:
    - name: 'C:\standalone\srum-dump2\'

winfor-standalones-srum-dump2-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SRUM-DUMP2.lnk'
    - target: 'C:\standalone\srum-dump2\srum-dump2.exe'
    - force: True
    - working_dir: 'C:\standalone\srum-dump2\'
    - makedirs: True
    - require:
      - file: srum-dump2-download
      - file: srum-dump2-template-download
