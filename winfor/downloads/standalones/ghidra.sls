# Name: Ghidra
# Website: https://github.com/NationalSecurityAgency/ghidra
# Description: Software Reverse Engineering framework
# Category: Executables
# Author: National Security Agency
# License: Apache License 2.0 (https://github.com/NationalSecurityAgency/ghidra/blob/master/LICENSE)
# Version: 12.0.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '12.0.4' %}
{% set hash = 'c3b458661d69e26e203d739c0c82d143cc8a4a29d9e571f099c2cf4bda62a120' %}
{% set date = '20260303' %}

ghidra-download-only:
  file.managed:
    - name: '{{ downloads }}\ghidra\ghidra_{{ version }}_PUBLIC_{{ date }}.zip'
    - source: https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_{{ version }}_build/ghidra_{{ version }}_PUBLIC_{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
