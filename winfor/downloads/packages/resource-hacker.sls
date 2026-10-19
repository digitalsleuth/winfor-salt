# Name: Resource Hacker
# Website: https://www.angusj.com/resourcehacker
# Description: Compiler and Decompiler for Windows applications
# Category: Executables
# Author: Angus Johnson
# License: Freeware (https://www.angusj.com/resourcehacker - License to Use)
# Version: 5.2.8
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.2.8' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('resource-hacker') %}

resource-hacker-download-only:
  file.managed:
    - name: '{{ downloads }}\resource-hacker\resource-hacker-{{ version }}.exe'
    - source: https://angusj.com/resourcehacker/reshacker_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
