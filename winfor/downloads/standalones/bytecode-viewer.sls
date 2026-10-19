# Name: Bytecode Viewer
# Website: https://github.com/konloch/bytecode-viewer
# Description: Android APK reverse engineering suite
# Category: Mobile Analysis
# Author: Konloch
# License: GNU General Public License v3 (https://github.com/Konloch/bytecode-viewer/blob/master/LICENSE)
# Version: 2.13.2
# Notes: 

{% set version = '2.13.2' %}
{% set hash = '2e23ead17825711bfbf25ffbc6c6af32ca89b057a8e7ccb856cc096ed7f83516' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bytecode-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\bytecode-viewer\bytecode-viewer-{{ version }}.jar'
    - source: https://github.com/Konloch/bytecode-viewer/releases/download/v{{ version }}/Bytecode-Viewer-{{ version }}.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True
