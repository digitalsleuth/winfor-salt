# Name: Letos (formerly SQLiteStudio)
# Website: https://letos.org/
# Description: SQLite Database browser, creator, editor
# Category: Databases
# Author: Pawel Salawa
# License: GNU General Public License v3 (https://github.com/pawelsalawa/letos/blob/master/LICENSE)
# Version: 4.0.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.0.0' %}
{% set hash = '0984b245810a758ef0863a45e9f6c5416e2640dd3ed42f8696eda63bbdeb38c5' %}

letos-download-only:
  file.managed:
    - name: '{{ downloads }}\letos\letos-{{ version }}.exe'
    - source: https://github.com/pawelsalawa/letos/releases/download/{{ version }}/Letos-{{ version }}-windows-x64-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
