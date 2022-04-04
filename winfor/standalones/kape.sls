# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = '1.2.0.0' %}
{% set hash = '5445407833b29afbca4300e930813faa5c101ad628126d16e9f90857c249444a' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

kape-download:
  file.managed:
    - name: 'C:\salt\tempdownload\kape.zip'
    - source: https://s3.amazonaws.com/cyb-us-prd-kape/kape.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

kape-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload'
    - source: 'C:\salt\tempdownload\kape.zip'
    - enforce_toplevel: False
    - require:
      - file: kape-download

kape-folder-move:
  file.rename:
    - name: 'C:\standalone\kape'
    - source: 'C:\salt\tempdownload\KAPE\'
    - force: True
    - makedirs: True
    - require:
      - archive: kape-extract

kape-env-vars:
  win_path.exists:
    - name: 'C:\standalone\kape\'

winfor-standalones-gkape-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\gkape.lnk'
    - target: 'C:\standalone\kape\gkape.exe'
    - force: True
    - working_dir: 'C:\standalone\kape\'
    - makedirs: True
    - require:
      - file: kape-folder-move
