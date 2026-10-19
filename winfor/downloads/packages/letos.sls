# Name: Letos (formerly SQLiteStudio)
# Website: https://letos.org/
# Description: SQLite Database browser, creator, editor
# Category: Databases
# Author: Pawel Salawa
# License: GNU General Public License v3 (https://github.com/pawelsalawa/letos/blob/master/LICENSE)
# Version: 4.0.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.0.4' %}
{% set hash = 'c470431db62977a1b38d27dc41ac2e593b52b2415184ce4b18e9ace90a1a41d2' %}

letos-download-only:
  file.managed:
    - name: '{{ downloads }}\letos\letos-{{ version }}.exe'
    - source: https://github.com/pawelsalawa/letos/releases/download/{{ version }}/Letos-{{ version }}-windows-x64-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
