# Name: Active Disk Editor
# Website: https://www.disk-editor.org
# Description: File / Disk Editor and Template Manager
# Category: Acquisition and Analysis
# Author: LSoft Technologies
# License: https://www.lsoft.net/terms/
# Version: 25
# Notes: 

{% set hash = '8df270147ea1cc4a4c516c280d288ea19a131ad771d32280ffa41deb01c88e73' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '25' %}

active-disk-editor-download-only:
  file.managed:
    - name: '{{ downloads }}\active-disk-editor\diskeditor-freeware-{{ version }}.exe'
    - source: https://www.disk-editor.org/download/diskeditor-freeware.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
