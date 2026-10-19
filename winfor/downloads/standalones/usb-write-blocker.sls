# Name: USB Registry Write Blocker
# Website: https://github.com/digitalsleuth/registry-write-block
# Description: USB Write Blocker for standard USB / UASP devices using Registry Modifications
# Category: Utilities
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/Registry-Write-Block/blob/master/LICENSE)
# Version: 2.0
# Notes: 

{% set version = '2.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('usb-write-blocker') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

usb-write-blocker-download-only:
  file.managed:
    - name: '{{ downloads }}\usb-write-blocker\usb-write-blocker-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/Registry-Write-Block/releases/download/v{{ version }}/USB-Write-Blocker-v{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
