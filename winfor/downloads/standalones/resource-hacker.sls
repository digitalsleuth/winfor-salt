# Name: Resource Hacker
# Website: http://www.angusj.com/resourcehacker
# Description: Compiler and Decompiler for Windows applications
# Category: Executables
# Author: Angus Johnson
# License: Freeware (http://www.angusj.com/resourcehacker - License to Use)
# Version: 5.1.8
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

resource-hacker-download-only:
  file.managed:
    - name: '{{ downloads }}\reshacker_setup.exe'
    - source: salt://winfor/files/reshacker_setup.exe
    - source_hash: sha256=080e97f7c198aeeac2a172f055c09d8da365b59b58bf6a71bde4486d9992ff66
    - makedirs: True
