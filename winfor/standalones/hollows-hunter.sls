# Name: hollows_hunter
# Website: https://github.com/hasherezade/hollows_hunter
# Description: Scans running processes for implants and dumps them if found
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/hollows_hunter/blob/master/LICENSE)
# Version: 0.4.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.4.1' %}
{% set hash = '4d6a3a2f786ab06820758b815e184d5fbad5dfd5140c106a7c5c9589e50dbe99' %}

hollows-hunter-download:
  file.managed:
    - name: '{{ inpath }}\hollows-hunter\hollows-hunter.exe'
    - source: https://github.com/hasherezade/hollows_hunter/releases/download/v{{ version }}/hollows_hunter64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

hollows-hunter-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\hollows-hunter\'
