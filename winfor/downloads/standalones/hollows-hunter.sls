# Name: hollows_hunter
# Website: https://github.com/hasherezade/hollows_hunter
# Description: Scans running processes for implants and dumps them if found
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/hollows_hunter/blob/master/LICENSE)
# Version: 0.3.5
# Notes: 

{% set version = '0.3.5' %}
{% set hash = 'b7117f3e7f8b921914c8e0c9649560067a17343369cd581db75b1145ad581bb9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

hollows-hunter-download-only:
  file.managed:
    - name: '{{ downloads }}\hollows-hunter.exe'
    - source: https://github.com/hasherezade/hollows_hunter/releases/download/v{{ version }}/hollows_hunter64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
