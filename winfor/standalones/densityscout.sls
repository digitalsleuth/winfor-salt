# Name: densityscout
# Website: https://cert.at
# Description: Tool to identify entropy within files
# Category: Executables
# Author: Christian Wojner / CERT.at (https://cert.at/en/about-us/overview/)
# License: Internet Software Consortium License (ISCL - https://cert.at/en/downloads/software/software-densityscout)
# Version: Build 45
# Notes:

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('densityscout') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.config.shims

densityscout-download:
  file.managed:
    - name: 'C:\salt\tempdownload\densityscout_build_45_windows.zip'
    - source: https://cert.at/media/files/downloads/software/densityscout/files/densityscout_build_45_windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

densityscout-extract:
  archive.extracted:
    - name: '{{ inpath }}\densityscout\'
    - source: 'C:\salt\tempdownload\densityscout_build_45_windows.zip'
    - enforce_toplevel: False
    - require:
      - file: densityscout-download

densityscout-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\densityscout\win64\densityscout.exe -OutPath {{ inpath }}\shims\densityscout.exe'
    - require:
      - sls: winfor.config.shims
