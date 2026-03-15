# Name: Binary Ninja
# Website: https://binary.ninja
# Description: Decompiler, Disassembler, Debugger
# Category: Executables
# Author: Vector 35
# License: Non-commercial / Student License (https://docs.binary.ninja/about/license.html)
# Version: 5.2.8722
# Notes: 

{% set version = '5.2.8722' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'a46bd2f8e587a949132ddbc5e1ea240a4c8c717272cd424316569d56b3dd1a24' %}

binary-ninja-free-download-only:
  file.managed:
    - name: '{{ downloads }}\binary-ninja\binaryninja_free_win64-{{ version }}.exe'
    - source: https://cdn.binary.ninja/installers/binaryninja_free_win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
