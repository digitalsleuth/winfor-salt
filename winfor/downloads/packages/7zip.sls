# Name: 7-Zip
# Website: https://7-zip.org
# Description: Zip Compiler and Extractor
# Category: Requirements
# Author: Igor Pavlov
# License: GNU LGPL (https://www.7-zip.org/faq.html)
# Version: 23.01
# Notes: 

{% set version = '2301' %}
{% set hash = '0ba639b6dacdf573d847c911bd147c6384381a54dac082b1e8c77bc73d58958b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

7zip-download-only:
  file.managed:
    - name: '{{ downloads }}\7z{{ version }}-x64.msi'
    - source: https://d3.7-zip.org/a/7z{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
