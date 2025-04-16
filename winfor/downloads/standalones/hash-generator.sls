# Name: Hash Generator
# Website: https://github.com/digitalsleuth/hash-generator
# Description: A simple tool for generating hash values out of provided strings
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/digitalsleuth/hash-generator/blob/main/LICENSE)
# Version: 2.1.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'E3C40DD20884351B6553FF64E985D18D8EB6C1BFD165CA18814F84D028CB492C' %}
{% set version = '2.1.0' %}

hash-generator-download-only:
  file.managed:
    - name: '{{ downloads }}\hash-generator\hash-generator-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/hash-generator/releases/download/v{{ version }}/Hash.Generator.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
