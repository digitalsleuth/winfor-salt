# Name: MSI Viewer
# Website: https://github.com/wjk/MSIExtractApp
# Description: Tool for viewing and extracting MSI installers
# Category: Installers
# Author: William Kent
# License: MIT (https://github.com/wjk/MSIExtractApp/blob/main/LICENSE)
# Version: 4.0.1
# Notes: 

{% set version = '4.0.1' %}
{% set hash = '9c3e9f77438d88419fca795879898ad576b46d34d6ce9cbb7ba74b9368d1f194' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

msiviewer-download-only:
  file.managed:
    - name: '{{ downloads }}\msiviewer\msiviewer-{{ version }}.msixbundle'
    - source: https://github.com/wjk/MSIExtractApp/releases/download/v{{ version }}/MSIViewer_{{ version }}_Sideload.msixbundle
    - source_hash: sha256={{ hash }}
    - makedirs: True
