# Name: DCode
# Website: https://www.digital-detective.net/dcode
# Description: Timestamp encoder/decoder
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 5.7.26188.46
# Notes: 

{% set version = '5.7.26188.46' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dcode') %}

dcode:
  file.managed:
    - name: 'C:\salt\tempdownload\DCode-x86-EN-{{ version }}.zip'
    - source: https://www.digital-detective.net/download/download.php?downcode=ae2znu5994j1lforlh03
    - source_hash: sha256={{ hash }}
    - makedirs: True

dcode-archive:
  archive.extracted:
    - name: 'C:\salt\tempdownload\dcode'
    - source: 'C:\salt\tempdownload\DCode-x86-EN-{{ version }}.zip'
    - enforce_toplevel: False
    - watch:
      - file: dcode

dcode-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\dcode\DCode-x86-EN-{{ version }}.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH,!DESKTOPICON'
    - require:
      - file: dcode
      - archive: dcode-archive
