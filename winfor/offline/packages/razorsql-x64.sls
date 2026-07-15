# Name: RazorSQL
# Website: https://razorsql.com
# Description: SQL Database analysis tool
# Category: Databases
# Author: Richardson Software LLC
# License: https://razorsql.com/license.txt
# Version: 10.6.8
# Notes:

{% set version = '10.6.8' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'razorsql-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\razorsql\\' + pkg) %}

{% if exists %}
razorsql-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\razorsql\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
