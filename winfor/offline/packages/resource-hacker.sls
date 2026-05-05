# Name: Resource Hacker
# Website: http://www.angusj.com/resourcehacker
# Description: Compiler and Decompiler for Windows applications
# Category: Executables
# Author: Angus Johnson
# License: Freeware (http://www.angusj.com/resourcehacker - License to Use)
# Version: 5.2.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.2.4' %}
{% set hash = '4178d48ab09cc83b885915ebf972d8467ec779cee18a1ec360c8be61ec08e94a' %}

resource-hacker-download-only:
  file.managed:
    - name: '{{ downloads }}\resource-hacker\reshacker_setup-{{ version }}.exe'
    - source: https://angusj.com/resourcehacker/reshacker_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
