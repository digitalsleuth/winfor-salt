# Name: dex2jar
# Website: https://github.com/pxb1988/dex2jar
# Description: Android .dex and .class file analysis
# Category: Mobile Analysis
# Author: Bob Pan (pxb1988)
# License: Apache License v2.0 (https://github.com/pxb1988/dex2jar/blob/2.x/LICENSE.txt)
# Version: 2.4
# Notes: 

{% set version = '2.4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dex2jar') %}

dex2jar-download-only:
  file.managed:
    - name: '{{ downloads }}\dex2jar\dex-tools-{{ version }}.zip'
    - source: https://github.com/pxb1988/dex2jar/releases/download/v{{ version }}/dex-tools-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
