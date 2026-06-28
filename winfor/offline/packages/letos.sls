# Name: Letos (formerly SQLiteStudio)
# Website: https://letos.org/
# Description: SQLite Database browser, creator, editor
# Category: Databases
# Author: Pawel Salawa
# License: GNU General Public License v3 (https://github.com/pawelsalawa/letos/blob/master/LICENSE)
# Version: 4.0.0
# Notes: 

{% set version = '4.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'letos-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\letos\\' + pkg) %}

{% if exists %}
letos-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /ALLUSERS /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\letos\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
