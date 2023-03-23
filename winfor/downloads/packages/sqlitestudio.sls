# Name: SQLiteStudio
# Website: https://sqlitestudio.pl/
# Description: SQLite Database browser, creator, editor
# Category: Databases
# Author: Pawel Salawa
# License: GNU General Public License v3 (https://github.com/pawelsalawa/sqlitestudio/blob/master/LICENSE)
# Version: 3.4.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.4.1' %}
{% set hash = 'a48ce5d3ae3f0e903346ce3f305c224419ed94c3e17335b111b2a11d4fcb8417' %}

sqlitestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\SQLiteStudio-{{ version }}-windows-x64-installer.exe'
    - source: https://github.com/pawelsalawa/sqlitestudio/releases/download/{{ version }}/SQLiteStudio-{{ version }}-windows-x64-installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
