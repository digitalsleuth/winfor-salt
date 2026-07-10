# Name: Hibernation-Recon
# Website: https://arsenalrecon.com
# Description: Tool to parse a Windows hibernation file
# Category: Windows Analysis
# Author: Arsenal Recon
# License: EULA
# Version: 1.2.3.96
# Notes:

{% set version = '1.2.3.96' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'hiber-recon-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\hiber-recon\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.dotnet6-desktop-runtime
  - winfor.config.shims

hiber-recon-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\hiber-recon\{{ pkg }}'
    - enforce_toplevel: True
    - overwrite: True
    - require:
      - sls: winfor.offline.packages.dotnet6-desktop-runtime

hiber-recon-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\hibernation-recon'
    - source: '{{ inpath }}\Hibernation-Recon-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: hiber-recon-extract-offline

hiber-recon-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hibernation Recon.lnk'
    - target: '{{ inpath }}\hibernation-recon\HibernationRecon.exe'
    - force: True
    - working_dir: '{{ inpath }}\hibernation-recon\'
    - makedirs: True
    - require:
      - archive: hiber-recon-extract-offline
      - file: hiber-recon-folder-rename-offline

hibernation-recon-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hibernation-recon\HibernationRecon.exe -OutPath {{ inpath }}\shims\HibernationRecon.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}