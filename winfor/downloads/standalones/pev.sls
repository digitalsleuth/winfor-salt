# Name: pev
# Website: https://github.com/merces/pev
# Description: PE Analysis toolkit
# Category: Executables
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/merces/pev/blob/master/LICENSE)
# Version: 0.81
# Notes:

{% set version = '0.81' %}
{% set hash = '2D0F8AAD6701585D073C167C7C4358950B95A03F18A2B194A97F78F59825F5F3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pev-download-only:
  file.managed:
    - name: '{{ downloads }}\pev-{{ version }}-win.zip'
    - source: https://github.com/merces/pev/releases/download/v{{ version }}/pev-{{ version }}-win.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
