# Name: LogFileParser
# Website: https://github.com/jschicht/LogFileParser
# Description: NTFS $LogFile Parser
# Category: Windows Analysis
# Author: Joakim Schicht
# License: MIT (https://github.com/jschicht/LogFileParser/blob/master/LICENSE.md)
# Version: 2.0.0.49
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '0a6a1a74802bc9ef8c5ce3d7a4a472d9f69c67c08a66337f30f4321f7f00fcaf' %}
{% set version = '2.0.0.49' %}

winfor-standalones-logfileparser:
  file.managed:
    - name: 'C:\salt\tempdownload\LogFileParser_v{{ version }}.zip'
    - source: https://github.com/jschicht/LogFileParser/releases/download/v{{ version }}/LogFileParser_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

logfileparser-extract:
  archive.extracted:
    - name: 'C:\standalone\logfileparser\'
    - source: 'C:\salt\tempdownload\LogFileParser_v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: winfor-standalones-logfileparser

logfileparser-env-vars:
  win_path.exists:
    - name: 'C:\standalone\logfileparser\'
    - require:
      - archive: logfileparser-extract

winfor-standalones-logfileparser-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\LogFileParser64.lnk'
    - target: 'C:\standalone\logfileparser\LogFileParser64.exe'
    - icon_location: 'C:\standalone\logfileparser\LogFileParser64.exe'
    - force: True
    - working_dir: 'C:\standalone\logfileparser'
    - makedirs: True
    - require:
      - archive: logfileparser-extract
