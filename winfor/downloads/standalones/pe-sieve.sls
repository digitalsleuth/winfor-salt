# Name: pe-sieve
# Website: https://github.com/hasherezade/pe-sieve
# Description: Scans a process and dumps possible implants
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/pe-sieve/blob/master/LICENSE)
# Version: 0.3.5
# Notes: 

{% set version = '0.3.5' %}
{% set hash = '87e996706571f87fdde79176531eb4851446bccc22fdeedd3be07ca78aaf0838' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pe-sieve-download-only:
  file.managed:
    - name: '{{ downloads }}\pe-sieve.exe'
    - source: https://github.com/hasherezade/pe-sieve/releases/download/v{{ version }}/pe-sieve64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
