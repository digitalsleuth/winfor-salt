# Name: LogParser Studio
# Website: https://techcommunity.microsoft.com/gxcuf89792/attachments/gxcuf89792/Exchange/16744/1/LPSV2.D2.zip?WT.mc_id=M365-MVP-5002016
# Description: Graphical interface for Microsoft's log parser
# Category: Logs
# Author: Microsoft
# License: 
# Version: 2.0.0.100
# Notes: 

{% set version = '2.0.0.100' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.logparser
  - winfor.config.shims

logparser-studio-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\logparser-studio\LPSV2.D2-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - sls: winfor.offline.packages.logparser

logparser-studio-rename-offline:
  file.rename:
    - name: '{{ inpath }}\logparser-studio'
    - source: '{{ inpath }}\LPSV2.D1'
    - force: True
    - makedirs: True
    - require:
      - archive: logparser-studio-extract-offline

logparser-studio-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\logparser-studio\LPS.exe -OutPath {{ inpath }}\shims\LPS.exe'
    - require:
      - sls: winfor.config.shims

logparser-studio-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\LogParser-Studio.lnk'
    - target: '{{ inpath }}\logparser-studio\LPS.exe'
    - force: True
    - working_dir: '{{ inpath }}\logparser-studio'
    - makedirs: True
    - require:
      - file: logparser-studio-rename-offline
