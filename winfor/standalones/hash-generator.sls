# Name: Hash Generator
# Website: https://github.com/digitalsleuth/hash-generator
# Description: A simple tool for generating hash values out of provided strings
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/digitalsleuth/hash-generator/blob/main/LICENSE)
# Version: 2.0.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '8f54a62c26544401dcea25a801011f5a0a7d3c5c8a8efbb67c4417e359a40164' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set version = '2.0.0' %}

hash-generator-download:
  file.managed:
    - name: '{{ inpath }}\hash-generator\hash-generator.exe'
    - source: https://github.com/digitalsleuth/hash-generator/releases/download/v{{ version }}/Hash.Generator.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

hash-generator-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hash Generator.lnk'
    - target: '{{ inpath }}\hash-generator\hash-generator.exe'
    - force: True
    - working_dir: '{{ inpath }}\hash-generator\'
    - makedirs: True
    - require:
      - file: hash-generator-download
