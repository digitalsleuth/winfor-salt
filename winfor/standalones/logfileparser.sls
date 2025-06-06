# Name: LogFileParser
# Website: https://github.com/jschicht/LogFileParser
# Description: NTFS $LogFile Parser
# Category: Windows Analysis
# Author: Joakim Schicht
# License: MIT (https://github.com/jschicht/LogFileParser/blob/master/LICENSE.md)
# Version: 2.0.0.53
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '68fb4f9f54135e1951febf825de37e47fe13b2ac2733fcc63e8fe26dd729e58a' %}
{% set version = '2.0.0.53' %}

standalones-logfileparser:
  file.managed:
    - name: 'C:\salt\tempdownload\LogFileParser_v{{ version }}.zip'
    - source: https://github.com/jschicht/LogFileParser/releases/download/v{{ version }}/LogFileParser_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

logfileparser-extract:
  archive.extracted:
    - name: '{{ inpath }}\logfileparser\'
    - source: 'C:\salt\tempdownload\LogFileParser_v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: standalones-logfileparser

logfileparser-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\logfileparser\'
    - require:
      - archive: logfileparser-extract

standalones-logfileparser-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\LogFileParser64.lnk'
    - target: '{{ inpath }}\logfileparser\LogFileParser64.exe'
    - icon_location: '{{ inpath }}\logfileparser\LogFileParser64.exe'
    - force: True
    - working_dir: '{{ inpath }}\logfileparser'
    - makedirs: True
    - require:
      - archive: logfileparser-extract
