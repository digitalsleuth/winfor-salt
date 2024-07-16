# Name: pe-sieve
# Website: https://github.com/hasherezade/pe-sieve
# Description: Scans a process and dumps possible implants
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/pe-sieve/blob/master/LICENSE)
# Version: 0.3.9
# Notes: 

{% set version = '0.3.9' %}
{% set hash = '17333939639d02e6780524bf1e932bd80243474c464c304ec9ff8a5926eb4ef9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pe-sieve-download-only:
  file.managed:
    - name: '{{ downloads }}\pe-sieve\pe-sieve-{{ version }}.exe'
    - source: https://github.com/hasherezade/pe-sieve/releases/download/v{{ version }}/pe-sieve64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
