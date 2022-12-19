# Name: LogParser Studio
# Website: https://techcommunity.microsoft.com/gxcuf89792/attachments/gxcuf89792/Exchange/16744/1/LPSV2.D2.zip?WT.mc_id=M365-MVP-5002016
# Description: Graphical interface for Microsoft's log parser
# Category: Logs
# Author: Microsoft
# License: 
# Version: 2.0.0.100
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'cf4e8fb1970230c0cb699324246d14b5406e284e566a1e06717d1b785b77c893' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.logparser

logparser-studio-download:
  file.managed:
    - name: 'C:\salt\tempdownload\LPSV2.D2.zip'
    - source: https://techcommunity.microsoft.com/gxcuf89792/attachments/gxcuf89792/Exchange/16744/1/LPSV2.D2.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.logparser

logparser-studio-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\LPSV2.D2.zip'
    - enforce_toplevel: False
    - require:
      - file: logparser-studio-download

logparser-studio-rename:
  file.rename:
    - name: '{{ inpath }}\logparser-studio'
    - source: '{{ inpath }}\LPSV2.D1'
    - force: True
    - makedirs: True
    - require:
      - archive: logparser-studio-extract

logparser-studio-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\logparser-studio'

winfor-standalones-logparser-studio-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\LogParser-Studio.lnk'
    - target: '{{ inpath }}\logparser-studio\LPS.exe'
    - force: True
    - working_dir: '{{ inpath }}\logparser-studio'
    - makedirs: True
    - require:
      - file: logparser-studio-rename
