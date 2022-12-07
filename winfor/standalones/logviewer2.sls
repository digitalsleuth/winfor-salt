# Name: LogViewer2
# Website: https://github.com/woanware/LogViewer2
# Description: View large text / log files
# Category: Logs
# Author: Mark Woan
# License: 
# Version: 1.0.0
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

logviewer2-download:
  file.managed:
    - name: 'C:\salt\tempdownload\LogViewer2.v1.0.0.zip'
    - source: https://github.com/woanware/LogViewer2/releases/download/v1.0.0/LogViewer2.v1.0.0.zip
    - source_hash: sha256=71aad9479657e5673f56b21b58977e151fa1ed4d82d55164e25e6aeaaeea4fa2
    - makedirs: True

logviewer2-extracted:
  archive.extracted:
    - name: 'C:\standalone\logviewer2'
    - source: 'C:\salt\tempdownload\LogViewer2.v1.0.0.zip'
    - enforce_toplevel: False
    - require:
      - file: logviewer2-download

logviewer2-env-vars:
  win_path.exists:
    - name: 'C:\standalone\logviewer2\'

logviewer2-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\LogViewer2.lnk'
    - target: 'C:\standalone\logviewer2\LogViewer2.exe'
    - force: True
    - working_dir: 'C:\standalone\logviewer2\'
    - makedirs: True
    - require:
      - file: logviewer2-download
      - archive: logviewer2-extracted
