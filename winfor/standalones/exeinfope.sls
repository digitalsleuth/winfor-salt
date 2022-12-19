# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.7.3
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '7eecd5d2dd37dbbc5169c6c7d179a4f5ac45a179c74a707a7d2d972b63b09fc5' %}

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

winfor-standalones-exeinfope-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ExeInfoPE.lnk'
    - target: '{{ inpath }}\ExeinfoPe\exeinfope.exe'
    - force: True
    - working_dir: '{{ inpath }}\ExeinfoPe\'
    - makedirs: True
    - require:
      - file: exeinfope-download
      - archive: exeinfope-extract
