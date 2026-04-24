# Name: Binary Ninja
# Website: https://binary.ninja
# Description: Decompiler, Disassembler, Debugger
# Category: Executables
# Author: Vector 35
# License: Non-commercial / Student License (https://docs.binary.ninja/about/license.html)
# Version: 5.3.9434
# Notes: 

{% set version = '5.3.9434' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '897d086a34e7166c56f7d944c69352f3126561f023d8fff5662ddb7a722aee01' %}

binary-ninja-free-download-only:
  file.managed:
    - name: '{{ downloads }}\binary-ninja\binaryninja_free_win64-{{ version }}.exe'
    - source: https://cdn.binary.ninja/installers/binaryninja_free_win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
