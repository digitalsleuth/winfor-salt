# Name: Bytecode Viewer
# Website: https://github.com/konloch/bytecode-viewer
# Description: Android APK reverse engineering suite
# Category: Mobile Analysis
# Author: Konloch
# License: GNU General Public License v3 (https://github.com/Konloch/bytecode-viewer/blob/master/LICENSE)
# Version: 2.12
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.12' %}
{% set hash = 'dc5f6669409d7d0bbba40c735875a39960c1777f11bb13a1819bb12917808c5c' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.jdk17

bytecode-viewer-download:
  file.managed:
    - name: '{{ inpath }}\bytecode-viewer\Bytecode-Viewer-{{ version }}.jar'
    - source: https://github.com/Konloch/bytecode-viewer/releases/download/v{{ version }}/Bytecode-Viewer-{{ version }}.jar
    - source_hash: sha256={{ hash }}
    - makedirs: True

standalones-bytecode-viewer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Bytecode Viewer.lnk'
    - target: '{{ inpath }}\bytecode-viewer\Bytecode-Viewer-{{ version }}.jar'
    - force: True
    - working_dir: '{{ inpath }}\bytecode-viewer\'
    - makedirs: True
    - require:
      - file: bytecode-viewer-download
      - sls: winfor.packages.jdk17
