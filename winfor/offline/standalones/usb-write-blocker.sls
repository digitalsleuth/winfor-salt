# Name: USB Registry Write Blocker
# Website: https://github.com/digitalsleuth/registry-write-block
# Description: USB Write Blocker for standard USB / UASP devices using Registry Modifications
# Category: Utilities
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/Registry-Write-Block/blob/master/LICENSE)
# Version: 2.0
# Notes: 

{% set version = '2.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'usb-write-blocker-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\usb-write-blocker\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

usb-write-blocker-offline:
  file.managed:
    - name: '{{ inpath }}\usb-write-blocker\usb-write-blocker.exe'
    - source: '{{ downloads }}\usb-write-blocker\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - force: True

usb-write-blocker-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\USB Write Blocker.lnk'
    - target: '{{ inpath }}\usb-write-blocker\usb-write-blocker.exe'
    - force: True
    - working_dir: '{{ inpath }}\usb-write-blocker'
    - makedirs: True
    - require:
      - file: usb-write-blocker-offline

usb-write-blocker-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\usb-write-blocker\usb-write-blocker.exe -OutPath {{ inpath }}\shims\usb-write-blocker.exe'
    - require:
      - sls: winfor.config.shims
      - file: usb-write-blocker-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
