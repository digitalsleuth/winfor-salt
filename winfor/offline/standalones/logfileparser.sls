# Name: LogFileParser
# Website: https://github.com/jschicht/LogFileParser
# Description: NTFS $LogFile Parser
# Category: Windows Analysis
# Author: Joakim Schicht
# License: MIT (https://github.com/jschicht/LogFileParser/blob/master/LICENSE.md)
# Version: 2.0.0.53
# Notes: 

{% set version = '2.0.0.53' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

logfileparser-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\logfileparser\'
    - source: '{{ downloads }}\logfileparser\LogFileParser_v{{ version }}.zip'
    - enforce_toplevel: False

logfileparser-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\logfileparser\logfileparser.exe -OutPath {{ inpath }}\shims\logfileparser.exe'
    - require:
      - sls: winfor.config.shims

logfileparser64-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\logfileparser\logfileparser64.exe -OutPath {{ inpath }}\shims\logfileparser64.exe'
    - require:
      - sls: winfor.config.shims

logfileparser-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\LogFileParser64.lnk'
    - target: '{{ inpath }}\logfileparser\LogFileParser64.exe'
    - icon_location: '{{ inpath }}\logfileparser\LogFileParser64.exe'
    - force: True
    - working_dir: '{{ inpath }}\logfileparser'
    - makedirs: True
    - require:
      - archive: logfileparser-extract-offline
