# Name: Aurora Incident Response
# Website: https://github.com/cyb3rfox/Aurora-Incident-Response
# Description: Incident Response Tracking tool
# Category: Utilities
# Author: Mathias Fuchs
# License: Apache License 2.0 (https://github.com/cyb3rfox/Aurora-Incident-Response/blob/master/LICENSE)
# Version: 0.6.6
# Notes: 

{% set version = '0.6.6' %}
{% set hash = '293471F8248A0A7BD8CEBB16E7D9253E43CE810AC5755E2E707C8863CA4D6362' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

aurora-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\aurora\Aurora-win32-x64-{{ version }}.zip'
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
