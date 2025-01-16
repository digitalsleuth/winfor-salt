# Name: Hash Generator
# Website: https://github.com/digitalsleuth/hash-generator
# Description: A simple tool for generating hash values out of provided strings
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/digitalsleuth/hash-generator/blob/main/LICENSE)
# Version: 2.0.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '8f54a62c26544401dcea25a801011f5a0a7d3c5c8a8efbb67c4417e359a40164' %}
{% set version = '2.0.0' %}

hash-generator-download-only:
  file.managed:
    - name: '{{ downloads }}\hash-generator\hash-generator-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/hash-generator/releases/download/v{{ version }}/Hash.Generator.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
