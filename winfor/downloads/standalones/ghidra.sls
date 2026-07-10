# Name: Ghidra
# Website: https://github.com/NationalSecurityAgency/ghidra
# Description: Software Reverse Engineering framework
# Category: Executables
# Author: National Security Agency
# License: Apache License 2.0 (https://github.com/NationalSecurityAgency/ghidra/blob/master/LICENSE)
# Version: 12.1.2
# Notes: 

{% set version = '12.1.2' %}
{% set date = '20260605' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'b62e81a0390618466c019c60d8c2f796ced2509c4c1aea4a37644a77272cf99d' %}

ghidra-download-only:
  file.managed:
    - name: '{{ downloads }}\ghidra\ghidra-{{ version }}.zip'
    - source: https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_{{ version }}_build/ghidra_{{ version }}_PUBLIC_{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
