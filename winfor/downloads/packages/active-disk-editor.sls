# Name: Active Disk Editor
# Website: https://www.disk-editor.org
# Description: File / Disk Editor and Template Manager
# Category: Acquisition and Analysis
# Author: LSoft Technologies
# License: https://www.lsoft.net/terms/
# Version: 24
# Notes: 

{% set hash = 'e6a25c5ccc73994c46c43bc9e56bd872a486b1843d01de7510001d594e17917b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '24' %}

active-disk-editor-download-only:
  file.managed:
    - name: '{{ downloads }}\active-disk-editor\diskeditor-freeware-{{ version }}.exe'
    - source: https://www.disk-editor.org/download/diskeditor-freeware.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
