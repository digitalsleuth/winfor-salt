# Name: LogViewer2
# Website: https://github.com/woanware/LogViewer2
# Description: View large text / log files
# Category: Logs
# Author: Mark Woan
# License: 
# Version: 1.0.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

logviewer2-download:
  file.managed:
    - name: 'C:\salt\tempdownload\LogViewer2.v1.0.0.zip'
    - source: https://github.com/woanware/LogViewer2/releases/download/v1.0.0/LogViewer2.v1.0.0.zip
    - source_hash: sha256=71aad9479657e5673f56b21b58977e151fa1ed4d82d55164e25e6aeaaeea4fa2
    - makedirs: True

logviewer2-extracted:
  archive.extracted:
    - name: '{{ inpath }}\logviewer2'
    - source: 'C:\salt\tempdownload\LogViewer2.v1.0.0.zip'
    - enforce_toplevel: False
    - require:
      - file: logviewer2-download

logviewer2-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\logviewer2\Logviewer2.exe -OutPath {{ inpath }}\shims\logviewer2.exe'
    - require:
      - sls: winfor.config.shims

logviewer2-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\LogViewer2.lnk'
    - target: '{{ inpath }}\logviewer2\LogViewer2.exe'
    - force: True
    - working_dir: '{{ inpath }}\logviewer2\'
    - makedirs: True
    - require:
      - file: logviewer2-download
      - archive: logviewer2-extracted
