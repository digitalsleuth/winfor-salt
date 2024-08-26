# Name: USB Registry Write Blocker
# Website: https://github.com/digitalsleuth/registry-write-block
# Description: USB Write Blocker for standard USB / UASP devices using Registry Modifications
# Category: Utilities
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/Registry-Write-Block/blob/master/LICENSE)
# Version: 2.0
# Notes: 

{% set version = '2.0' %}
{% set hash = '972c5b39b3796ed5cf77a2c602822c31f992e5c3a7b4210aa90a3a323de92440' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

usb-write-blocker-download-only:
  file.managed:
    - name: '{{ downloads }}\usb-write-blocker\USB-Write-Blocker-v{{ version }}-x64.exe'
    - source: https://github.com/digitalsleuth/Registry-Write-Block/releases/download/v{{ version }}/USB-Write-Blocker-v{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
