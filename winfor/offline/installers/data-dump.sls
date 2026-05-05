# Name: Data Dump
# Website: https://www.digital-detective.net/datadump/
# Description: Tool to extract segments of data from an image or device
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 2.3.24262.11
# Notes: x86

{% set version = '2.3.24262.11' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

data-dump-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\data-dump\'
    - source: '{{ downloads }}\data-dump\DataDump-x86-EN-{{ version }}.zip'
    - enforce_toplevel: False

data-dump-install-offline:
  cmd.run:
    - name: '{{ downloads }}\data-dump\DataDump-x86-EN-{{ version }}.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH,!DESKTOPICON'
    - require:
      - archive: data-dump-extract-offline
