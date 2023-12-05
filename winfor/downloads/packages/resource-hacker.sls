# Name: Resource Hacker
# Website: http://www.angusj.com/resourcehacker
# Description: Compiler and Decompiler for Windows applications
# Category: Executables
# Author: Angus Johnson
# License: Freeware (http://www.angusj.com/resourcehacker - License to Use)
# Version: 5.2.6
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.2.6' %}
{% set hash = '246457363396dcea4cc3d19ce2a431897bac948ae1694d3e87cc0ebaf2ea39f5' %}

resource-hacker-download-only:
  file.managed:
    - name: '{{ downloads }}\resource-hacker\reshacker_setup-{{ version }}.exe'
    - source: https://angusj.com/resourcehacker/reshacker_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
