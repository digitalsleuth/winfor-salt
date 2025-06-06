# Name: ImportExcel
# Website: https://github.com/dfinke/ImportExcel
# Description: Powershell Module for working with Excel documents
# Category: Utilities
# Author: Doug Finke
# License: Apache License v2.0 (https://github.com/dfinke/ImportExcel/blob/master/LICENSE.txt)
# Version: 7.8.10
# Notes: Installed directly from PSGallery

{% set version = '7.8.10' %}
{% set hash = '23723a8eb5fb5020bc170bd4c492fea0efbcf4c517ae48b8509ec9f650e08b19' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

importexcel-download-only:
  file.managed:
    - name: '{{ downloads }}\ImportExcel\ImportExcel-v{{ version }}.zip'
    - source: https://github.com/dfinke/ImportExcel/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
