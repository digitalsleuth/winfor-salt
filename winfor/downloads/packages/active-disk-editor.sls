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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('active-disk-editor') %}

active-disk-editor-download-only:
  file.managed:
    - name: '{{ downloads }}\active-disk-editor\active-disk-editor-{{ version }}.exe'
    - source: https://www.disk-editor.org/download/diskeditor-freeware.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
