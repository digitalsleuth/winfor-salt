# Name: Ghidra
# Website: https://github.com/NationalSecurityAgency/ghidra
# Description: Software Reverse Engineering framework
# Category: Executables
# Author: National Security Agency
# License: Apache License 2.0 (https://github.com/NationalSecurityAgency/ghidra/blob/master/LICENSE)
# Version: 12.1.2
# Notes: 

{% set version = '12.1.2' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set date = get_hash('ghidra', 'date') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = get_hash('ghidra') %}

ghidra-download-only:
  file.managed:
    - name: '{{ downloads }}\ghidra\ghidra-{{ version }}.zip'
    - source: https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_{{ version }}_build/ghidra_{{ version }}_PUBLIC_{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
