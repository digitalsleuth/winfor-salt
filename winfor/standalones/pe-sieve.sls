# Name: pe-sieve
# Website: https://github.com/hasherezade/pe-sieve
# Description: Scans a process and dumps possible implants
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/pe-sieve/blob/master/LICENSE)
# Version: 0.4.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.4.1' %}
{% set hash = '3fb0b6c407dff0fcfedc78e1cbadb936b46c7732a44bcfad5b6cc57c318c4e43' %}

pe-sieve-download:
  file.managed:
    - name: '{{ inpath }}\pe-sieve\pe-sieve.exe'
    - source: https://github.com/hasherezade/pe-sieve/releases/download/v{{ version }}/pe-sieve64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

pe-sieve-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\pe-sieve\'
