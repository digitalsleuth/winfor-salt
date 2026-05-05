# Name: MSI Viewer
# Website: https://github.com/wjk/MSIExtractApp
# Description: Tool for viewing and extracting MSI installers
# Category: Installers
# Author: William Kent
# License: MIT (https://github.com/wjk/MSIExtractApp/blob/main/LICENSE)
# Version: 3.0.1
# Notes: Installed via winget

{% set version = '3.0.1' %}
{% set hash = 'd0a11bf5ce84f20b490bbd54a992a0bbc62ddc464bef0696523fb2776baeac02' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

msiviewer-download-only:
  file.managed:
    - name: '{{ downloads }}\msiviewer\MSIViewer_{{ version }}_Sideload.msixbundle'
    - source: https://github.com/wjk/MSIExtractApp/releases/download/v{{ version }}/MSIViewer_{{ version }}_Sideload.msixbundle
    - source_hash: sha256={{ hash }}
    - makedirs: True
