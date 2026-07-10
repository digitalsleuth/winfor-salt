# Name: Binary Ninja
# Website: https://binary.ninja
# Description: Decompiler, Disassembler, Debugger
# Category: Executables
# Author: Vector 35
# License: Non-commercial / Student License (https://docs.binary.ninja/about/license.html)
# Version: 5.3.9757
# Notes: 

{% set version = '5.3.9757' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '5f6096acb03dd70d1a0572257c44471a0b62653788348cf69dc829212882a618' %}

binary-ninja-free-download-only:
  file.managed:
    - name: '{{ downloads }}\binary-ninja\binary-ninja-{{ version }}.exe'
    - source: https://cdn.binary.ninja/installers/binaryninja_free_win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
