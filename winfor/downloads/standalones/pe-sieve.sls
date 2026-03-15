# Name: pe-sieve
# Website: https://github.com/hasherezade/pe-sieve
# Description: Scans a process and dumps possible implants
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/pe-sieve/blob/master/LICENSE)
# Version: 0.4.1.1
# Notes: 

{% set version = '0.4.1.1' %}
{% set hash = '9f3ff2884a2c61006cd0a92b7572a815b8dc17012be7747a6abd6ca07c503a3b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pe-sieve-download-only:
  file.managed:
    - name: '{{ downloads }}\pe-sieve\pe-sieve-{{ version }}.exe'
    - source: https://github.com/hasherezade/pe-sieve/releases/download/v{{ version }}/pe-sieve64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
