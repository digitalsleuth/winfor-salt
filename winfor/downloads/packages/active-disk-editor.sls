# Name: Active Disk Editor
# Website: https://www.disk-editor.org
# Description: File / Disk Editor and Template Manager
# Category: Acquisition and Analysis
# Author: LSoft Technologies
# License: https://www.lsoft.net/terms/
# Version: 23.0.1
# Notes: 

{% set hash = 'f4525250c8efa68fc442d3590781e39fbc9cbb106cc5c513d67ffb31d6f5ab38' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

active-disk-editor-download-only:
  file.managed:
    - name: '{{ downloads }}\diskeditor-freeware.exe'
    - source: https://www.disk-editor.org/download/diskeditor-freeware.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
