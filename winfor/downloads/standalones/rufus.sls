# Name: Rufus
# Website: https://rufus.ie
# Description: USB ISO Creator
# Category: Utilities
# Author: Pete Batard
# License: GNU General Public License v3 - https://github.com/pbatard/rufus/blob/master/LICENSE.txt
# Version: 4.15
# Notes:

{% set version = '4.15' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('rufus') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

rufus-download-only:
  file.managed:
    - name: '{{ downloads }}\rufus\rufus-{{ version }}.exe'
    - source: https://github.com/pbatard/rufus/releases/download/v{{ version }}/rufus-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
