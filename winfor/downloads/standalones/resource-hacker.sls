# Name: Resource Hacker
# Website: http://www.angusj.com/resourcehacker
# Description: Compiler and Decompiler for Windows applications
# Category: Executables
# Author: Angus Johnson
# License: Freeware (http://www.angusj.com/resourcehacker - License to Use)
# Version: 5.2.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.2.1' %}
{% set hash = '6e0983a234b07eb29290060368d344f684a747f3dcff7ff1db143948e8b574bb' %}

resource-hacker-download-only:
  file.managed:
    - name: '{{ downloads }}\resource-hacker\reshacker_setup-{{ version }}.exe'
    - source: https://angusj.com/resourcehacker/reshacker_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
