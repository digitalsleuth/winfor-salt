# Name: HxD 
# Website: https://mh-nexus.de
# Description: Hex Editor
# Category: Raw Parsers / Decoders
# Author: Mael Horz
# License: https://mh-nexus.de/en/about.php
# Version: 2.5.0.0
# Notes:

{% set version = '2.5.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'hxd-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\hxd\\' + pkg) %}

{% if exists %}

hxd-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\hxd\'
    - source: '{{ downloads }}\hxd\{{ pkg }}'
    - enforce_toplevel: False

hxd-install-offline:
  cmd.run:
    - name: '{{ downloads }}\hxd\HxDSetup.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH'
    - shell: cmd
    - require:
      - archive: hxd-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
