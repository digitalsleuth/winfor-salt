# Name: hollows_hunter
# Website: https://github.com/hasherezade/hollows_hunter
# Description: Scans running processes for implants and dumps them if found
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/hollows_hunter/blob/master/LICENSE)
# Version: 0.4.1.1
# Notes: 

{% set version = '0.4.1.1' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('hollows-hunter') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

hollows-hunter-download-only:
  file.managed:
    - name: '{{ downloads }}\hollows-hunter\hollows-hunter-{{ version }}.exe'
    - source: https://github.com/hasherezade/hollows_hunter/releases/download/v{{ version }}/hollows_hunter64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
