# Name: Live Response Collection (Cedarpelta)
# Website: https://www.brimorlabs.com/tools/
# Description: Incident Response Artifact Parser and Extractor
# Category: Windows Analysis
# Author: Brian Moran
# License: GNU General Public License v3.0 (see COPYING in zip file)
# Version: Cedarpelta - 20190905
# Notes: Also does macOS and Linux collection

{% set version = '20190905' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

lrc-cedarpelta-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\lrc-cedarpelta'
    - source: '{{ downloads }}\lrc-cedarpelta\LiveResponseCollection-Cedarpelta-{{ version }}.zip'
    - enforce_toplevel: False

lrc-cedarpelta-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe "{{ inpath }}\lrc-cedarpelta\Windows_Live_Response\Windows Live Response Collection.exe" -OutPath {{ inpath }}\shims\lrc-cedarpelta.exe'
    - require:
      - sls: winfor.config.shims

lrc-cedarpelta-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Live Response Collection - Cedarpelta.lnk'
    - target: '{{ inpath }}\lrc-cedarpelta\Windows_Live_Response\Windows Live Response Collection.exe'
    - force: True
    - working_dir: '{{ inpath }}\lrc-cedarpelta\Windows_Live_Response\'
    - makedirs: True
    - require:
      - archive: lrc-cedarpelta-extract-offline
