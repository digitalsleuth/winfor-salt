# Name: Hash Generator
# Website: https://github.com/digitalsleuth/hash-generator
# Description: A simple tool for generating hash values out of provided strings
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/digitalsleuth/hash-generator/blob/main/LICENSE)
# Version: 1.1.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'ba30018ff3aab4326d535d80a6378fa78c2c7f3b6e0eb5c125512e06b9676827' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set version = '1.1.0' %}

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
