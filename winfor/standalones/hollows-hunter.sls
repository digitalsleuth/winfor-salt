# Name: hollows_hunter
# Website: https://github.com/hasherezade/hollows_hunter
# Description: Scans running processes for implants and dumps them if found
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/hollows_hunter/blob/master/LICENSE)
# Version: 0.4.1.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.4.1.1' %}
{% set hash = '56a58a8bbf2cec9a5c7c68129e8863af6181fb51dfc25226f1a756aba66b4707' %}

include:
  - winfor.config.shims

hollows-hunter-download:
  file.managed:
    - name: '{{ inpath }}\hollows-hunter\hollows-hunter.exe'
    - source: https://github.com/hasherezade/hollows_hunter/releases/download/v{{ version }}/hollows_hunter64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

hollows-hunter-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hollows-hunter\hollows-hunter.exe -OutPath {{ inpath }}\shims\hollows-hunter.exe'
    - require:
      - sls: winfor.config.shims
