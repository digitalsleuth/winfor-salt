# Name: lessmsi
# Website: https://github.com/activescott/lessmsi
# Description: View and Extract the contents of a Windows MSI file
# Category: Installers
# Author: Scott Willeke (activescott)
# License: MIT License (https://github.com/activescott/lessmsi/blob/master/LICENSE)
# Version: 2.12.9
# Notes: 

{% set version = '2.12.9' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'lessmsi-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\lessmsi\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

lessmsi-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\lessmsi'
    - source: '{{ downloads }}\lessmsi\{{ pkg }}'
    - enforce_toplevel: False

lessmsi-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\lessmsi.lnk'
    - target: '{{ inpath }}\lessmsi\lessmsi-gui.exe'
    - force: True
    - working_dir: '{{ inpath }}\lessmsi\'
    - makedirs: True
    - require:
      - archive: lessmsi-extract-offline

lessmsi-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\lessmsi\lessmsi.exe -OutPath {{ inpath }}\shims\lessmsi.exe'
    - require:
      - sls: winfor.config.shims
      - archive: lessmsi-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
