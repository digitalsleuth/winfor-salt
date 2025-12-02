# Name: megatools
# Website: https://megatools.megous.com
# Description: Mega.NZ downloader suite
# Category: Utilities
# Author: https://megatools.megous.com/man/megatools.html#_author
# License: GNU General Public License v2 (https://megous.com/git/megatools/tree/LICENSE)
# Version: 1.11.5
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.11.5' %}
{% set date = '20250706' %}
{% set hash = 'bd1269e50d9c45e369c14e287c1754c9506e1b11efcc0cd4bb95d460c9d782b5' %}

megatools-download:
  file.managed:
    - name: 'C:\salt\tempdownload\megatools-{{ version }}.{{ date }}-win64.zip'
    - source: 'https://megatools.megous.com/builds/builds/megatools-{{ version }}.{{ date }}-win64.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True

megatools-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\megatools-{{ version }}.{{ date }}-win64.zip'
    - enforce_toplevel: True
    - require:
      - file: megatools-download

megatools-folder-rename:
  file.rename:
    - name: '{{ inpath }}\megatools'
    - source: '{{ inpath }}\megatools-{{ version }}.{{ date }}-win64\'
    - force: True
    - makedirs: True
    - require:
      - archive: megatools-extract

megatools-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\megatools\'
    - require:
      - file: megatools-download
      - archive: megatools-extract
