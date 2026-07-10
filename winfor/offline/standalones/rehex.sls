# Name: Rehex (Reverse Engineers' Hex Editor)
# Website: https://github.com/solemnwarning/rehex
# Description: Hex Editor with useful tools for Reverse Engineering
# Category: Executables
# Author: Daniel Collins
# License: GNU General Public License v2 (https://github.com/solemnwarning/rehex/blob/master/LICENSE.txt)
# Version: 0.64.0
# Notes:

{% set version = '0.64.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'rehex-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\rehex\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

rehex-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\rehex\{{ pkg }}'
    - enforce_toplevel: False
    - overwrite: True

rehex-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\rehex'
    - source: '{{ inpath }}\rehex-{{ version }}'
    - force: True
    - makedirs: True
    - require:
      - archive: rehex-extract-offline

rehex-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\REHex.lnk'
    - target: '{{ inpath }}\rehex\rehex.exe'
    - force: True
    - working_dir: '{{ inpath }}\rehex\'
    - makedirs: True
    - require:
      - archive: rehex-extract-offline
      - file: rehex-folder-rename-offline

rehex-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\rehex\rehex.exe -OutPath {{ inpath }}\shims\rehex.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
