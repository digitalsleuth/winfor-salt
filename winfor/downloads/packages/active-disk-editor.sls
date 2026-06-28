# Name: Active Disk Editor
# Website: https://www.disk-editor.org
# Description: File / Disk Editor and Template Manager
# Category: Acquisition and Analysis
# Author: LSoft Technologies
# License: https://www.lsoft.net/terms/
# Version: 26.1.3
# Notes: 

{% set version = '26.1.3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '00b4462977a01fd6bf05d64d0115cc605c73a06e6bd9d6e332a01a198b310296' %}

active-disk-editor-download-only:
  file.managed:
    - name: '{{ downloads }}\active-disk-editor\active-disk-editor-{{ version }}.exe'
    - source: https://www.disk-editor.org/download/diskeditor-freeware.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
