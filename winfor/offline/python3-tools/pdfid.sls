# Name: pdfid
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: PDF Analysis Tool
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.2.10
# Notes: 

{% set version = '0.2.10' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'pdfid.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\pdfid\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

pdfid-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\pdfid'
    - source: '{{ downloads }}\pdfid'
    - makedirs: True
    - force: True

pdfid-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pdfid.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\python.exe" {{ inpath }}\pdfid\pdfid.py %*'
    - require:
      - file: pdfid-folder-rename-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
