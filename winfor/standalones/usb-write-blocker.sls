# Name: USB Registry Write Blocker
# Website: https://github.com/digitalsleuth/registry-write-block
# Description: USB Write Blocker for standard USB / UASP devices using Registry Modifications
# Category: Utilities
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/Registry-Write-Block/blob/master/LICENSE)
# Version: 2.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('usb-write-blocker') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

standalones-usb-write-blocker:
  file.managed:
    - name: '{{ inpath }}\usb-write-blocker\USB-Write-Blocker-v{{ version }}-x64.exe'
    - source: https://github.com/digitalsleuth/Registry-Write-Block/releases/download/v{{ version }}/USB-Write-Blocker-v{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

standalones-usb-write-blocker-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\USB Write Blocker.lnk'
    - target: '{{ inpath }}\usb-write-blocker\USB-Write-Blocker-v{{ version }}-x64.exe'
    - force: True
    - working_dir: '{{ inpath }}\usb-write-blocker'
    - makedirs: True
    - require:
      - file: standalones-usb-write-blocker

usb-write-blocker-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\usb-write-blocker\USB-Write-Blocker-v{{ version }}-x64.exe -OutPath {{ inpath }}\shims\usb-write-blocker.exe'
    - require:
      - sls: winfor.config.shims
