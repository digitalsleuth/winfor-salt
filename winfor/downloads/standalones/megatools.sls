# Name: megatools
# Website: https://megatools.megous.com
# Description: Mega.NZ downloader suite
# Category: Utilities
# Author: https://megatools.megous.com/man/megatools.html#_author
# License: GNU General Public License v2 (https://megous.com/git/megatools/tree/LICENSE)
# Version: 1.11.5
# Notes:

{% set version = '1.11.5' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set date = get_hash('megatools', 'date') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = get_hash('megatools') %}

megatools-download-only:
  file.managed:
    - name: '{{ downloads }}\megatools\megatools-{{ version }}.zip'
    - source: https://xff.cz/megatools/builds/builds/megatools-{{ version }}.{{ date }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

megatools-extract-only:
  archive.extracted:
    - name: '{{ downloads }}\megatools\'
    - source: '{{ downloads }}\megatools\megatools-{{ version }}.zip'
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
