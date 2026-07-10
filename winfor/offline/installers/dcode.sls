# Name: DCode
# Website: https://www.digital-detective.net/dcode
# Description: Timestamp encoder/decoder
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 5.7.26188.46
# Notes: 

{% set version = '5.7.26188.46' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'dcode-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\dcode\\' + pkg) %}

{% if exists %}

dcode-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\dcode\'
    - source: '{{ downloads }}\dcode\{{ pkg }}'
    - enforce_toplevel: False

dcode-install-offline:
  cmd.run:
    - name: '{{ downloads }}\dcode\DCode-x86-EN-{{ version }}.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH,!DESKTOPICON'
    - require:
      - archive: dcode-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
