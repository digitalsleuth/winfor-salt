# Name: xsv
# Website: https://github.com/BurntSushi/xsv
# Description: Command Line CSV manipulator
# Category: Utilities
# Author: Andrew Gallant
# License: Dual License - MIT or UNLICENSE (https://github.com/BurntSushi/xsv/blob/master/UNLICENSE)
# Version: 0.13.0
# Notes: 

{% set version = '0.13.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'xsv-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\xsv\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

xsv-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\xsv\'
    - source: '{{ downloads }}\xsv\xsv-{{ version }}.zip'
    - enforce_toplevel: False

xsv-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\xsv\xsv.exe -OutPath {{ inpath }}\shims\xsv.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}