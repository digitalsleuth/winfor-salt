# Name: pe-sieve
# Website: https://github.com/hasherezade/pe-sieve
# Description: Scans a process and dumps possible implants
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/pe-sieve/blob/master/LICENSE)
# Version: 0.3.6
# Notes: 

{% set version = '0.3.6' %}
{% set hash = 'c16f12338cfba07f4ed77bbc70389c04382199a1484d25844e8ad96f3c51b2c7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pe-sieve-download-only:
  file.managed:
    - name: '{{ downloads }}\pe-sieve\pe-sieve-{{ version }}.exe'
    - source: https://github.com/hasherezade/pe-sieve/releases/download/v{{ version }}/pe-sieve64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
