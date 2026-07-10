# Name: Bintext
# Website: https://mcafee.com
# Description: Finds Ascii, Unicode, and Resource strings in a file
# Category: Executables
# Author: Mcafee
# License: Free
# Version: 3.03
# Notes: 

{% set version = '3.03' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'bintext-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\bintext\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

bintext-extract-offline:
  archive.extracted:
    - name: {{ inpath }}\bintext\
    - source: '{{ downloads }}\bintext\{{ pkg }}'
    - enforce_toplevel: False

bintext-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\bintext\bintext.exe -OutPath {{ inpath }}\shims\bintext.exe'
    - require:
      - sls: winfor.config.shims

bintext-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\BinText.lnk'
    - target: {{ inpath }}\bintext\bintext.exe
    - force: True
    - working_dir: {{ inpath }}\bintext\
    - makedirs: True
    - require:
      - archive: bintext-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
