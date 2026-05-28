# Name: SQLiteStudio
# Website: https://sqlitestudio.pl/
# Description: SQLite Database browser, creator, editor
# Category: Databases
# Author: Pawel Salawa
# License: GNU General Public License v3 (https://github.com/pawelsalawa/sqlitestudio/blob/master/LICENSE)
# Version: 3.4.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.4.4' %}
{% set hash = '4428f83914717fa581b4bd1eca35573739aa8ebea14e58b0392decd41b631a72' %}

sqlitestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\sqlitestudio\SQLiteStudio-{{ version }}-windows-x64-installer.exe'
    - source: https://github.com/pawelsalawa/sqlitestudio/releases/download/{{ version }}/SQLiteStudio-{{ version }}-windows-x64-installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
