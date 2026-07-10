# Name: Backup2FS
# Website: https://elusivedata.io/
# Description: Apple iOS backup viewer
# Category: Mobile Analysis
# Author: James Eichbaum
# License: Copyright (https://github.com/eichbaumj/Backup2FS#license)
# Version: 3.0.0
# Notes:

{% set version = '3.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'backup2fs-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\backup2fs\\' + pkg) %}

{% if exists %}
backup2fs-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\backup2fs'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
