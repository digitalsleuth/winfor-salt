# Name: Active Disk Editor
# Website: https://www.disk-editor.org
# Description: File / Disk Editor and Template Manager
# Category: Acquisition and Analysis
# Author: LSoft Technologies
# License: https://www.lsoft.net/terms/
# Version: 26
# Notes: 

{% set hash = '1f1ce93cedc102bc4bc2e168a8713778cfc9e787b47757a88d849fd52586de77' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '26' %}

active-disk-editor-download-only:
  file.managed:
    - name: '{{ downloads }}\active-disk-editor\diskeditor-freeware-{{ version }}.exe'
    - source: https://www.disk-editor.org/download/diskeditor-freeware.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
