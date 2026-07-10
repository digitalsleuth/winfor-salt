# Name: LogViewer2
# Website: https://github.com/woanware/LogViewer2
# Description: View large text / log files
# Category: Logs
# Author: Mark Woan
# License: 
# Version: 1.0.0
# Notes: 

{% set version = '1.0.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'logviewer2-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\logviewer2\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

logviewer2-extracted-offline:
  archive.extracted:
    - name: '{{ inpath }}\logviewer2'
    - source: '{{ downloads }}\logviewer2\{{ pkg }}'
    - enforce_toplevel: False

logviewer2-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\logviewer2\Logviewer2.exe -OutPath {{ inpath }}\shims\logviewer2.exe'
    - require:
      - sls: winfor.config.shims
      - archive: logviewer2-extracted-offline

logviewer2-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\LogViewer2.lnk'
    - target: '{{ inpath }}\logviewer2\LogViewer2.exe'
    - force: True
    - working_dir: '{{ inpath }}\logviewer2\'
    - makedirs: True
    - require:
      - archive: logviewer2-extracted-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
