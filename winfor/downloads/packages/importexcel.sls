# Name: ImportExcel
# Website: https://github.com/dfinke/ImportExcel
# Description: Powershell Module for working with Excel documents
# Category: Utilities
# Author: Doug Finke
# License: Apache License v2.0 (https://github.com/dfinke/ImportExcel/blob/master/LICENSE.txt)
# Version: 7.8.10
# Notes: Installed directly from PSGallery

{% set version = '7.8.10' %}
{% set hash = 'd8a1d79dc8cf10c0eea30b68b70459b3fb4cac0042fb756fcb23890671857e4c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

importexcel-download-only:
  file.managed:
    - name: '{{ downloads }}\importexcel\importexcel.{{ version }}.nupkg'
    - source: https://cdn.powershellgallery.com/packages/importexcel.{{ version }}.nupkg
    - source_hash: sha256={{ hash }}
    - makedirs: True
