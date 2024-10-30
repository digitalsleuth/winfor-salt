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
{% set date = '20241028' %}
{% set hash = '41abc4548dbe2f2b633221c6310a8fb0f31658846eac816e2d87cffc042c000b' %}

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
