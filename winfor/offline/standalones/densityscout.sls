# Name: densityscout
# Website: https://cert.at
# Description: Tool to identify entropy within files
# Category: Executables
# Author: Christian Wojner / CERT.at (https://cert.at/en/about-us/overview/)
# License: Internet Software Consortium License (ISCL - https://cert.at/en/downloads/software/software-densityscout)
# Version: Build 45
# Notes:

{% set version = '45' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set pkg = 'densityscout-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\densityscout\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

densityscout-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\densityscout\'
    - source: '{{ downloads }}\densityscout\{{ pkg }}'
    - enforce_toplevel: False

densityscout-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\densityscout\win64\densityscout.exe -OutPath {{ inpath }}\shims\densityscout.exe'
    - require:
      - sls: winfor.config.shims
      - archive: densityscout-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
