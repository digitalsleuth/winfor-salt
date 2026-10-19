# Name: Bulk Extractor
# Website: https://digitalcorpora.org/downloads/bulk_extractor & https://github.com/simsong/bulk_extractor
# Description: Tool for extracting artifacts from random data
# Category: Raw Parsers / Decoders
# Author: Simson L. Garfinkel
# License: MIT License (https://github.com/simsong/bulk_extractor/blob/main/LICENSE.md)
# Version: 1.5.5
# Notes: 

{% set version = '1.5.5' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('bulk-extractor') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bulk-extractor-download-only:
  file.managed:
    - name: '{{ downloads }}\bulk-extractor\bulk-extractor-{{ version }}.exe'
    - source: https://digitalcorpora.org/downloads/bulk_extractor/bulk_extractor-{{ version }}-windowsinstaller.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
