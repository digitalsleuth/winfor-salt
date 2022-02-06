# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

exeinfope-download:
  file.managed:
    - name: 'C:\salt\tempdownload\exeinfope.zip'
    - source: https://github.com/ExeinfoASL/ASL/raw/master/exeinfope.zip
    - source_hash: sha256=c8739731e43990ae82e881f30f2469468fa4f2007a75c8691712fc37fde5d528
    - makedirs: True

exeinfope-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\exeinfope.zip'
    - enforce_toplevel: False
    - require:
      - file: exeinfope-download

exeinfope-env-vars:
  win_path.exists:
    - name: 'C:\standalone\exeinfope\'

winfor-standalones-exeinfope-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ExeInfoPE.lnk'
    - target: 'C:\standalone\ExeinfoPe\exeinfope.exe'
    - force: True
    - working_dir: 'C:\standalone\ExeinfoPe\'
    - makedirs: True
    - require:
      - file: exeinfope-download
      - archive: exeinfope-extract
