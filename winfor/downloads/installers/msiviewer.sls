# Name: MSI Viewer
# Website: https://github.com/wjk/MSIExtractApp
# Description: Tool for viewing and extracting MSI installers
# Category: Installers
# Author: William Kent
# License: MIT (https://github.com/wjk/MSIExtractApp/blob/main/LICENSE)
# Version: 4.0.1
# Notes: 

{% set version = '4.0.1' %}
{% set hash = '33a7c5bad27de73c4ab9881b503df55c184d01972fe13d844a8cec938a455275' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

msiviewer-download-only:
  file.managed:
    - name: '{{ downloads }}\msiviewer\msiviewer-{{ version }}.msixbundle'
    - source: https://github.com/wjk/MSIExtractApp/releases/download/v{{ version }}/MSIViewer_{{ version }}_Sideload.msixbundle
    - source_hash: sha256={{ hash }}
    - makedirs: True
