# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = '2.0.4' %}
{% set hash = '052176975e3dfbb990c303ee433bd0c67fb3722d8fafed9670916c31ee0639e5' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

cutter-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Cutter-v{{ version }}-x64.Windows.zip'
    - source: https://github.com/rizinorg/cutter/releases/download/v{{ version }}/Cutter-v{{ version }}-x64.Windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

cutter-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\Cutter-v{{ version }}-x64.Windows.zip'
    - enforce_toplevel: False
    - require:
      - file: cutter-download

cutter-folder-rename:
  file.rename:
    - name: 'C:\standalone\cutter'
    - source: 'C:\standalone\cutter-v{{ version }}-x64.Windows\'
    - force: True
    - makedirs: True
    - require:
      - archive: cutter-extract

winfor-standalones-cutter-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Cutter.lnk'
    - target: 'C:\standalone\cutter\cutter.exe'
    - force: True
    - working_dir: 'C:\standalone\cutter\'
    - makedirs: True
    - require:
      - file: cutter-download
      - archive: cutter-extract

