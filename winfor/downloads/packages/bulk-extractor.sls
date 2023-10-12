# Name: Bulk Extractor
# Website: https://digitalcorpora.org/downloads/bulk_extractor & https://github.com/simsong/bulk_extractor
# Description: Tool for extracting artifacts from random data
# Category: Raw Parsers / Decoders
# Author: Simson L. Garfinkel
# License: MIT License (https://github.com/simsong/bulk_extractor/blob/main/LICENSE.md)
# Version: 1.5.5
# Notes: 

{% set version = '1.5.5' %}
{% set hash = 'a410898e3452940c4aaa45bda6f32fe9447a61864266ff625c1916ee85764a39' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bulk-extractor-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-extractor\bulk_extractor-{{ version }}-windowsinstaller.exe'
    - source: https://digitalcorpora.org/downloads/bulk_extractor/bulk_extractor-{{ version }}-windowsinstaller.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
