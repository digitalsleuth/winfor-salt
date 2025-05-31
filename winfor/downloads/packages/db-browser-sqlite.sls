# Name: DB Browser for SQLite
# Website: https://sqlitebrowser.org
# Description: SQLite Database Browser
# Category: Databases
# Author: https://sqlitebrowser.org/about/
# License: Mozilla Public License v2 (https://github.com/sqlitebrowser/sqlitebrowser/blob/master/LICENSE)
# Version: 3.13.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.13.1' %}
{% set hash = 'd023d54b3a5db10c7e896089bb3dbe6e7f4bc4eaa9bbecb34ca414be5970f688' %}

db-browser-sqlite-download-only:
  file.managed:
    - name: '{{ downloads }}\db-browser-sqlite\DB.Browser.for.SQLite-v{{ version }}-win64.msi'
    - source: https://github.com/sqlitebrowser/sqlitebrowser/releases/download/v{{ version }}/DB.Browser.for.SQLite-v{{ version }}-win64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
