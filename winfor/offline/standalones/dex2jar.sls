# Name: dex2jar
# Website: https://github.com/pxb1988/dex2jar
# Description: Android .dex and .class file analysis
# Category: Mobile Analysis
# Author: Bob Pan (pxb1988)
# License: Apache License v2.0 (https://github.com/pxb1988/dex2jar/blob/2.x/LICENSE.txt)
# Version: 2.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '2.4' %}

include:
  - winfor.offline.packages.jdk17

dex2jar-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\dex2jar\dex-tools-v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - sls: winfor.offline.packages.jdk17

dex2jar-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\dex2jar'
    - source: '{{ inpath }}\dex-tools-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: dex2jar-extract-offline

dex2jar-env-vars-offline:
  win_path.exists:
    - names:
      - '{{ inpath }}\dex2jar\'
      - '{{ inpath }}\dex2jar\bin\'
    - require:
      - file: dex2jar-folder-rename-offline
