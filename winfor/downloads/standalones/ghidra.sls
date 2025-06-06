# Name: Ghidra
# Website: https://github.com/NationalSecurityAgency/ghidra
# Description: Software Reverse Engineering framework
# Category: Executables
# Author: National Security Agency
# License: Apache License 2.0 (https://github.com/NationalSecurityAgency/ghidra/blob/master/LICENSE)
# Version: 11.3.2
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '11.3.2' %}
{% set hash = '99d45035bdcc3d6627e7b1232b7b379905a9fad76c772c920602e2b5d8b2dac2' %}
{% set date = '20250415' %}

ghidra-download-only:
  file.managed:
    - name: '{{ downloads }}\ghidra\ghidra_{{ version }}_PUBLIC_{{ date }}.zip'
    - source: https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_{{ version }}_build/ghidra_{{ version }}_PUBLIC_{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
