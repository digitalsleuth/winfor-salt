# Name: pev
# Website: https://github.com/mentebinaria/readpe
# Description: PE Analysis toolkit
# Category: Executables
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/mentebinaria/readpe/blob/master/LICENSE)
# Version: 0.82
# Notes:

{% set version = '0.82' %}
{% set hash = '328f5324522715a5191acd6887bdfc86779a7ce7becffee64b36ce372cbb9ea4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pev-download-only:
  file.managed:
    - name: '{{ downloads }}\pev\pev-{{ version }}-win.zip'
    - source: https://github.com/mentebinaria/readpe/releases/download/v{{ version }}/pev-{{ version }}-win.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
