# Name: Hash Generator
# Website: https://github.com/digitalsleuth/hash-generator
# Description: A simple tool for generating hash values out of provided strings
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/digitalsleuth/hash-generator/blob/main/LICENSE)
# Version: 2.1.0
# Notes: 

{% set version = '2.1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'hash-generator-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\hash-generator\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.dotnet8-desktop-runtime

hash-generator-offline:
  file.managed:
    - name: '{{ inpath }}\hash-generator\hash-generator.exe'
    - source: '{{ downloads }}\hash-generator\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.dotnet8-desktop-runtime

hash-generator-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hash Generator.lnk'
    - target: '{{ inpath }}\hash-generator\hash-generator.exe'
    - force: True
    - working_dir: '{{ inpath }}\hash-generator\'
    - makedirs: True
    - require:
      - file: hash-generator-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}