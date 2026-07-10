# Name: pev
# Website: https://github.com/mentebinaria/readpe
# Description: PE Analysis toolkit
# Category: Executables
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/mentebinaria/readpe/blob/master/LICENSE)
# Version: 0.82
# Notes:

{% set version = '0.82' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'pev-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\pev\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

pev-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\pev\{{ pkg }}'
    - enforce_toplevel: True

pev-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\pev'
    - source: '{{ inpath }}\pev-{{ version }}-win\'
    - force: True
    - require:
      - archive: pev-extract-offline

pev-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\pev\readpe.exe -OutPath {{ inpath }}\shims\readpe.exe'
    - require:
      - sls: winfor.config.shims

pev-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PEV.lnk'
    - target: '{{ inpath }}\pev\run.bat'
    - icon_location: 'C:\Windows\SystemResources\imageres.dll.mun, 168'
    - force: True
    - working_dir: '{{ inpath }}\pev\'
    - makedirs: True
    - require:
      - archive: pev-extract-offline
      - file: pev-folder-rename-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
