# Name: pev
# Website: https://github.com/mentebinaria/readpe
# Description: PE Analysis toolkit
# Category: Executables
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/mentebinaria/readpe/blob/master/LICENSE)
# Version: 0.81
# Notes:

{% set version = '0.81' %}
{% set hash = '2d0f8aad6701585d073c167c7c4358950b95a03f18a2b194a97f78f59825f5f3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pev-download-only:
  file.managed:
    - name: '{{ downloads }}\pev-{{ version }}-win.zip'
    - source: https://github.com/merces/pev/releases/download/v{{ version }}/pev-{{ version }}-win.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
