# Name: dex2jar
# Website: https://github.com/pxb1988/dex2jar
# Description: Android .dex and .class file analysis
# Category: Mobile Analysis
# Author: Bob Pan (pxb1988)
# License: Apache License v2.0 (https://github.com/pxb1988/dex2jar/blob/2.x/LICENSE.txt)
# Version: 2.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.4' %}
{% set hash = 'ee7c45eb3c1d2474a6145d8d447e651a736a22d9664b6d3d3be5a5a817dda23a' %}

dex2jar-download-only:
  file.managed:
    - name: '{{ downloads }}\dex2jar\dex-tools-v{{ version }}.zip'
    - source: https://github.com/pxb1988/dex2jar/releases/download/v{{ version }}/dex-tools-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
