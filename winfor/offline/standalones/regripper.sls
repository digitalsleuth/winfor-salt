# Name: regripper
# Website: https://github.com/keydet89/RegRipper3.0
# Description: Registry parsing toolsuite
# Category: Registry
# Author: Harlan Carvey
# License: MIT License (https://github.com/keydet89/RegRipper3.0/blob/master/license.md)
# Version: 3.0
# Notes: rr.exe

{% set version = '3.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'rr.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\regripper\\regripper3\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

regripper-copy-offline:
  file.copy:
    - name: '{{ inpath }}\regripper'
    - source: '{{ downloads }}\regripper\regripper3'
    - recurse: True
    - makedirs: True
    - force: True

regripper-rip-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\regripper\rip.exe -OutPath {{ inpath }}\shims\rip.exe'
    - require:
      - sls: winfor.config.shims

regripper-rr-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\regripper\rr.exe -OutPath {{ inpath }}\shims\rr.exe'
    - require:
      - sls: winfor.config.shims

regripper-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\RegRipper.lnk'
    - target: '{{ inpath }}\regripper\rr.exe'
    - force: True
    - working_dir: '{{ inpath }}\regripper\'
    - makedirs: True
    - require:
      - file: regripper-copy-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
