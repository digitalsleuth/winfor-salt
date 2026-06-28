# Name: DCode
# Website: https://www.digital-detective.net/dcode
# Description: Timestamp encoder/decoder
# Category: Raw Parsers / Decoders
# Author: Craig Wilson (https://www.digital-detective.net)
# License: 
# Version: 5.6.24123.1
# Notes: 

{% set version = '5.6.24123.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set hash = '9ffe1106ee9d9f55b53d5707621d5990f493604e20f3dbdb0d22ec1b8ecb2458' %}

dcode-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\dcode\'
    - source: '{{ downloads }}\dcode\DCode-x86-EN-{{ version }}.zip'
    - enforce_toplevel: False

dcode-install-offline:
  cmd.run:
    - name: '{{ downloads }}\dcode\DCode-x86-EN-{{ version }}.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH,!DESKTOPICON'
    - require:
      - archive: dcode-extract-offline
