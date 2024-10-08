# Name: DB Browser for SQLite
# Website: https://sqlitebrowser.org
# Description: SQLite Database Browser
# Category: Databases
# Author: https://sqlitebrowser.org/about/
# License: Mozilla Public License v2 (https://github.com/sqlitebrowser/sqlitebrowser/blob/master/LICENSE)
# Version: 3.13.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.13.0' %}
{% set hash = '4fd5a308481fa8ff3008bcbd069da03944698f1397b509f22a43bfda93dfccd3' %}

db-browser-sqlite-download-only:
  file.managed:
    - name: '{{ downloads }}\db-browser-sqlite\DB.Browser.for.SQLite-v{{ version }}-win64.msi'
    - source: https://download.sqlitebrowser.org/DB.Browser.for.SQLite-v{{ version }}-win64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
