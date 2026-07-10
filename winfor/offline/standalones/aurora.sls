# Name: Aurora Incident Response
# Website: https://github.com/cyb3rfox/Aurora-Incident-Response
# Description: Incident Response Tracking tool
# Category: Utilities
# Author: Mathias Fuchs
# License: Apache License 2.0 (https://github.com/cyb3rfox/Aurora-Incident-Response/blob/master/LICENSE)
# Version: 0.6.6
# Notes: 

{% set version = '0.6.6' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'aurora-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\aurora\\' + pkg) %}

{% if exists %}

aurora-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\aurora\{{ pkg }}'
    - enforce_toplevel: False

aurora-folder-move-offline:
  file.rename:
    - name: '{{ inpath }}\aurora'
    - source: '{{ inpath }}\Aurora-win32-x64\'
    - force: True
    - makedirs: True
    - require:
      - archive: aurora-extract-offline

aurora-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Aurora.lnk'
    - target: '{{ inpath }}\aurora\Aurora.exe'
    - force: True
    - working_dir: '{{ inpath }}\aurora\'
    - makedirs: True
    - require:
      - file: aurora-folder-move-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
