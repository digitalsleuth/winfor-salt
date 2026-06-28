# Name: DB Browser for SQLite
# Website: https://sqlitebrowser.org
# Description: SQLite Database Browser
# Category: Databases
# Author: https://sqlitebrowser.org/about/
# License: Mozilla Public License v2 (https://github.com/sqlitebrowser/sqlitebrowser/blob/master/LICENSE)
# Version: 3.13.1
# Notes: 

{% set version = '3.13.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'db-browser-sqlite-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\db-browser-sqlite\\' + pkg) %}

{% if exists %}
db-browser-sqlite-install-offline:
  cmd.run:
    - name: '{{ pkg }} SHORTCUT_SQLITE_PROGRAMMENU=1 SHORTCUT_SQLCIPHER_PROGRAMMENU=1 /quiet /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\db-browser-sqlite\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
