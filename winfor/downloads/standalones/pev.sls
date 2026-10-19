# Name: pev
# Website: https://github.com/mentebinaria/readpe
# Description: PE Analysis toolkit
# Category: Executables
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/mentebinaria/readpe/blob/master/LICENSE)
# Version: 0.82
# Notes:

{% set version = '0.82' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('pev') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pev-download-only:
  file.managed:
    - name: '{{ downloads }}\pev\pev-{{ version }}.zip'
    - source: https://github.com/mentebinaria/readpe/releases/download/v{{ version }}/pev-{{ version }}-win.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
