# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Version: 0.0.7.3
# Notes: 

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
