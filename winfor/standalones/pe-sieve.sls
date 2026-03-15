# Name: pe-sieve
# Website: https://github.com/hasherezade/pe-sieve
# Description: Scans a process and dumps possible implants
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/pe-sieve/blob/master/LICENSE)
# Version: 0.4.1.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.4.1.1' %}
{% set hash = '9f3ff2884a2c61006cd0a92b7572a815b8dc17012be7747a6abd6ca07c503a3b' %}

include:
  - winfor.config.shims

pe-sieve-download:
  file.managed:
    - name: '{{ inpath }}\pe-sieve\pe-sieve.exe'
    - source: https://github.com/hasherezade/pe-sieve/releases/download/v{{ version }}/pe-sieve64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

pe-sieve-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\pe-sieve\pe-sieve.exe -OutPath {{ inpath }}\shims\pe-sieve.exe'
    - require:
      - sls: winfor.config.shims
