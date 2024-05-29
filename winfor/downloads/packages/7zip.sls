# Name: 7-Zip
# Website: https://7-zip.org
# Description: Zip Compiler and Extractor
# Category: Requirements
# Author: Igor Pavlov
# License: GNU LGPL (https://www.7-zip.org/faq.html)
# Version: 24.06
# Notes: 

{% set version = '2406' %}
{% set hash = '946e32bf1eb545146ad47287d0837b01de86329c20f7081fc171d543a8578ec9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

7zip-download-only:
  file.managed:
    - name: '{{ downloads }}\7zip\7z{{ version }}-x64.msi'
    - source: https://d3.7-zip.org/a/7z{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
