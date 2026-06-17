# Name: DB Browser for SQLite
# Website: https://sqlitebrowser.org
# Description: SQLite Database Browser
# Category: Databases
# Author: https://sqlitebrowser.org/about/
# License: Mozilla Public License v2 (https://github.com/sqlitebrowser/sqlitebrowser/blob/master/LICENSE)
# Version: 3.12.2
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.12.2' %}
{% set hash = '723d601f125b0d2402d9ea191e4b310345ec52f76b61e117bf49004a2ff9b8ae' %}

db-browser-sqlite-download-only:
  file.managed:
    - name: '{{ downloads }}\db-browser-sqlite\DB.Browser.for.SQLite-{{ version }}-win64.msi'
    - source: https://download.sqlitebrowser.org/DB.Browser.for.SQLite-{{ version }}-win64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
