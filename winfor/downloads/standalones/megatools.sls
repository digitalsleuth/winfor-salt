# Name: megatools
# Website: https://megatools.megous.com
# Description: Mega.NZ downloader suite
# Category: Utilities
# Author: https://megatools.megous.com/man/megatools.html#_author
# License: GNU General Public License v2 (https://megous.com/git/megatools/tree/LICENSE)
# Version: 1.11.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.11.1' %}
{% set date = '20230212' %}
{% set hash = 'FD3FFB6330C89783A37DF0B349EDC95C8018E919680A6AD518D27D4FA789954F' %}

megatools-download-only:
  file.managed:
    - name: '{{ downloads }}\megatools\megatools-{{ version }}.{{ date }}-win64.zip'
    - source: 'https://megatools.megous.com/builds/builds/megatools-{{ version }}.{{ date }}-win64.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True

megatools-extract-only:
  archive.extracted:
    - name: '{{ downloads }}\megatools\'
    - source: '{{ downloads }}\megatools\megatools-{{ version }}.{{ date }}-win64.zip'
    - enforce_toplevel: True
    - require:
      - file: megatools-download-only

megatools-folder-rename-only:
  file.rename:
    - name: '{{ downloads }}\megatools\megatools'
    - source: '{{ downloads }}\megatools\megatools-{{ version }}.{{ date }}-win64\'
    - force: True
    - makedirs: True
    - require:
      - archive: megatools-extract-only
