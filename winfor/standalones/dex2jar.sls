# Name: dex2jar
# Website: https://github.com/pxb1988/dex2jar
# Description: Android .dex and .class file analysis
# Category: Mobile Analysis
# Author: Bob Pan (pxb1988)
# License: Apache License v2.0 (https://github.com/pxb1988/dex2jar/blob/2.x/LICENSE.txt)
# Version: 2.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.4' %}
{% set hash = 'ee7c45eb3c1d2474a6145d8d447e651a736a22d9664b6d3d3be5a5a817dda23a' %}

include:
  - winfor.packages.jdk17

dex2jar-download:
  file.managed:
    - name: 'C:\salt\tempdownload\dex-tools-v{{ version }}.zip'
    - source: https://github.com/pxb1988/dex2jar/releases/download/v{{ version }}/dex-tools-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

dex2jar-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\dex-tools-v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: dex2jar-download
      - sls: winfor.packages.jdk17

dex2jar-folder-rename:
  file.rename:
    - name: '{{ inpath }}\dex2jar'
    - source: '{{ inpath }}\dex-tools-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: dex2jar-extract 

dex2jar-env-vars:
  win_path.exists:
    - names:
      - '{{ inpath }}\dex2jar\'
      - '{{ inpath }}\dex2jar\bin\'
