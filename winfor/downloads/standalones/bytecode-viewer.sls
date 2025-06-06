# Name: Bytecode Viewer
# Website: https://github.com/konloch/bytecode-viewer
# Description: Android APK reverse engineering suite
# Category: Mobile Analysis
# Author: Konloch
# License: GNU General Public License v3 (https://github.com/Konloch/bytecode-viewer/blob/master/LICENSE)
# Version: 2.12
# Notes: 

{% set version = '2.12' %}
{% set hash = 'dc5f6669409d7d0bbba40c735875a39960c1777f11bb13a1819bb12917808c5c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bytecode-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\bytecode-viewer\Bytecode-Viewer-{{ version }}.jar'
    - source: https://github.com/Konloch/bytecode-viewer/releases/download/v{{ version }}/Bytecode-Viewer-{{ version }}.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True
