# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Logs
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 3.10.0
# Notes:

{% set version = '3.10.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'hayabusa-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\hayabusa\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

hayabusa-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\hayabusa'
    - source: '{{ downloads }}\hayabusa\{{ pkg }}'
    - enforce_toplevel: False
    - overwrite: True

hayabusa-rename-offline:
  file.rename:
    - name: '{{ inpath }}\hayabusa\hayabusa.exe'
    - source: '{{ inpath }}\hayabusa\hayabusa-{{ version }}-win-x64.exe'
    - force: True
    - require:
      - archive: hayabusa-extract-offline

hayabusa-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hayabusa\hayabusa.exe -OutPath {{ inpath }}\shims\hayabusa.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}