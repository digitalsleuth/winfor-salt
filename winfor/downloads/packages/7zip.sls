# Name: 7-Zip
# Website: https://7-zip.org
# Description: Zip Compiler and Extractor
# Category: Requirements
# Author: Igor Pavlov
# License: GNU LGPL (https://www.7-zip.org/faq.html)
# Version: 22.00
# Notes: 

{% set version = '2200' %}
{% set hash = '5c6e1cc0a09de58131707c332add6e30cd299383999b8f047a90335f8066e217' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

7zip-download-only:
  file.managed:
    - name: '{{ downloads }}\7z{{ version }}-x64.msi'
    - source: https://d3.7-zip.org/a/7z{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
