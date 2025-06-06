# Name: SQLiteStudio
# Website: https://sqlitestudio.pl/
# Description: SQLite Database browser, creator, editor
# Category: Databases
# Author: Pawel Salawa
# License: GNU General Public License v3 (https://github.com/pawelsalawa/sqlitestudio/blob/master/LICENSE)
# Version: 3.4.17
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.4.17' %}
{% set hash = '5018ea571c2a3416944267d387cb75eea99d46ebd010f6aa5c35df1f7690c894' %}

sqlitestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\sqlitestudio\SQLiteStudio-{{ version }}-windows-x64-installer.exe'
    - source: https://github.com/pawelsalawa/sqlitestudio/releases/download/{{ version }}/SQLiteStudio-{{ version }}-windows-x64-installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
