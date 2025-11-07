# Name: Binary Ninja
# Website: https://binary.ninja
# Description: Decompiler, Disassembler, Debugger
# Category: Executables
# Author: Vector 35
# License: Non-commercial / Student License (https://docs.binary.ninja/about/license.html)
# Version: 5.1.8104
# Notes: 

{% set version = '5.1.8104' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '9f5443dd48a4eaf9ea04633816f563ab39377457f96e49c327942c8c7efed628' %}

binary-ninja-free-download-only:
  file.managed:
    - name: '{{ downloads }}\binary-ninja\binaryninja_free_win64-{{ version }}.exe'
    - source: https://cdn.binary.ninja/installers/binaryninja_free_win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
