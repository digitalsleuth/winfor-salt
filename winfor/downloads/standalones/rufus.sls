# Name: Rufus
# Website: https://rufus.ie
# Description: USB ISO Creator
# Category: Utilities
# Author: Pete Batard
# License: GNU General Public License v3 - https://github.com/pbatard/rufus/blob/master/LICENSE.txt
# Version: 4.7
# Notes:

{% set version = '4.7' %}
{% set hash = '45777d818fc9ba187bcc7b930583764130ea71100fd9e3c66d4a7143bdbce4c5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

rufus-download-only:
  file.managed:
    - name: '{{ downloads }}\rufus\rufus-{{ version }}.exe'
    - source: https://github.com/pbatard/rufus/releases/download/v{{ version }}/rufus-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
