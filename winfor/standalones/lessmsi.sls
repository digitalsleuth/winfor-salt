# Name: lessmsi
# Website: https://github.com/activescott/lessmsi
# Description: View and Extract the contents of a Windows MSI file
# Category: Installers
# Author: Scott Willeke (activescott)
# License: MIT License (https://github.com/activescott/lessmsi/blob/master/LICENSE)
# Version: 2.12.9
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.12.9' %}
{% set hash = '5b4e187e74b184ad3a63ccf06c3d17dae2b8c4b6c298a996dbd51a9f6db29d21' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

lessmsi-download:
  file.managed:
    - name: 'C:\salt\tempdownload\lessmsi-v{{ version }}.zip'
    - source: https://github.com/activescott/lessmsi/releases/download/v{{ version }}/lessmsi-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

lessmsi-extract:
  archive.extracted:
    - name: '{{ inpath }}\lessmsi'
    - source: 'C:\salt\tempdownload\lessmsi-v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: lessmsi-download

lessmsi-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\lessmsi.lnk'
    - target: '{{ inpath }}\lessmsi\lessmsi-gui.exe'
    - force: True
    - working_dir: '{{ inpath }}\lessmsi\'
    - makedirs: True
    - require:
      - file: lessmsi-download
      - archive: lessmsi-extract

lessmsi-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\lessmsi\lessmsi.exe -OutPath {{ inpath }}\shims\lessmsi.exe'
    - require:
      - sls: winfor.config.shims
