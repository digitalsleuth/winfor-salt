# Name: Aurora Incident Response
# Website: https://github.com/cyb3rfox/Aurora-Incident-Response
# Description: Incident Response Tracking tool
# Category: Automated tool that allows to track every single action performed during an investigation
# Author: Mathias Fuchs
# Version: 0.6.6
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '293471F8248A0A7BD8CEBB16E7D9253E43CE810AC5755E2E707C8863CA4D6362' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

aurora-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Aurora-win32-x64-0.6.6.zip'
    - source: https://github.com/cyb3rfox/Aurora-Incident-Response/releases/download/0.6.6/Aurora-win32-x64-0.6.6.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

aurora-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload'
    - source: 'C:\salt\tempdownload\Aurora-win32-x64-0.6.6.zip'
    - enforce_toplevel: False
    - require:
      - file: aurora-download

aurora-folder-move:
  file.rename:
    - name: '{{ inpath }}\aurora'
    - source: 'C:\salt\tempdownload\Aurora-win32-x64\'
    - force: True
    - makedirs: True
    - require:
      - archive: aurora-extract

aurora-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\aurora\'

standalones-aurora-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Aurora.lnk'
    - target: '{{ inpath }}\aurora\Aurora.exe'
    - force: True
    - working_dir: '{{ inpath }}\aurora\'
    - makedirs: True
    - require:
      - file: aurora-folder-move
