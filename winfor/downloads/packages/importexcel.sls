# Name: ImportExcel
# Website: https://github.com/dfinke/ImportExcel
# Description: Powershell Module for working with Excel documents
# Category: Utilities
# Author: Doug Finke
# License: Apache License v2.0 (https://github.com/dfinke/ImportExcel/blob/master/LICENSE.txt)
# Version: 7.8.6
# Notes: Installed directly from PSGallery

{% set version = '7.8.6' %}
{% set hash = '2567c01157a0b229a127e311d6187fb8b76d88f739dc35623272c06649755144' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

importexcel-download-only:
  file.managed:
    - name: '{{ downloads }}\ImportExcel\ImportExcel-v{{ version }}.zip'
    - source: https://github.com/dfinke/ImportExcel/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
