# Name: Hibernation-Recon
# Website: https://arsenalrecon.com
# Description: Tool to parse a Windows hibernation file
# Category: Windows Analysis
# Author: Arsenal Recon
# License: EULA
# Version: 1.2.3.87
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '1.2.3.87' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.dotnet6-desktop-runtime
  - winfor.config.shims

hiber-recon-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\hiber-recon\Hibernation-Recon-v{{ version }}.zip'
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
