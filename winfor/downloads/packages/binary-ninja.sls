# Name: Binary Ninja
# Website: https://binary.ninja
# Description: Decompiler, Disassembler, Debugger
# Category: Executables
# Author: Vector 35
# License: Non-commercial / Student License (https://docs.binary.ninja/about/license.html)
# Version: 5.0.7486.0
# Notes: 

{% set version = '5.0.7486.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '39f99c760a4397cd28fec32f487483ab0a199bbd60e46612e7a83e04f09c5394' %}

binary-ninja-free-download-only:
  file.managed:
    - name: '{{ downloads }}\binary-ninja\binaryninja_free_win64-{{ version }}.exe'
    - source: https://cdn.binary.ninja/installers/binaryninja_free_win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
