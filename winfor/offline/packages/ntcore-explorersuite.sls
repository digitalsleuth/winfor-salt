# Name: NTCore Explorer Suite
# Website: https://ntcore.com
# Description: PE Analysis tool suite
# Category: Executables
# Author: Erik Pistelli
# License: 
# Version: IV
# Notes: 

{% set version = 'IV' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'ntcore-explorersuite-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\ntcore-explorersuite\\' + pkg) %}

{% if exists %}
ntcore-explorersuite-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\ntcore-explorersuite\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
