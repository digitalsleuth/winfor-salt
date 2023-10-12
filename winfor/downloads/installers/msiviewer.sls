# Name: MSI Viewer
# Website: https://github.com/wjk/MSIExtractApp
# Description: Tool for viewing and extracting MSI installers
# Category: Installers
# Author: William Kent
# License: MIT (https://github.com/wjk/MSIExtractApp/blob/main/LICENSE)
# Version: 2.0.1
# Notes: Installed via winget

{% set version = '2.0.1' %}
{% set hash = '3e5ee1ee91d69ad901243e0bcb4f0877948f43d0e2e060d2e70abb6e64c0a883' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

msiviewer-download-only:
  file.managed:
    - name: '{{ downloads }}\msiviewer\MSIViewer_{{ version }}_Sideload.msixbundle'
    - source: https://github.com/wjk/MSIExtractApp/releases/download/v{{ version }}/MSIViewer_{{ version }}_Sideload.msixbundle
    - source_hash: sha256={{ hash }}
    - makedirs: True
