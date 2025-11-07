# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.9.3
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '15ad23914bf993541b746f83a6145fea5d80dad75960f2e634ee7d18b503a984' %}

exeinfope-download:
  file.managed:
    - name: 'C:\salt\tempdownload\exeinfope.zip'
    - source: https://github.com/ExeinfoASL/ASL/raw/master/exeinfope.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

exeinfope-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\exeinfope.zip'
    - enforce_toplevel: False
    - require:
      - file: exeinfope-download

exeinfope-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\exeinfope\'

standalones-exeinfope-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ExeInfoPE.lnk'
    - target: '{{ inpath }}\ExeinfoPe\exeinfope.exe'
    - force: True
    - working_dir: '{{ inpath }}\ExeinfoPe\'
    - makedirs: True
    - require:
      - file: exeinfope-download
      - archive: exeinfope-extract
