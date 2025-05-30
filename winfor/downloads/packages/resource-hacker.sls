# Name: Resource Hacker
# Website: http://www.angusj.com/resourcehacker
# Description: Compiler and Decompiler for Windows applications
# Category: Executables
# Author: Angus Johnson
# License: Freeware (http://www.angusj.com/resourcehacker - License to Use)
# Version: 5.2.8
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.2.8' %}
{% set hash = 'b611be2f35cb44efd1c29df03e7ebe62bd556a500585680e1afa5e073eaf1756' %}

resource-hacker-download-only:
  file.managed:
    - name: '{{ downloads }}\resource-hacker\reshacker_setup-{{ version }}.exe'
    - source: https://angusj.com/resourcehacker/reshacker_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
