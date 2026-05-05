# Name: Rufus
# Website: https://rufus.ie
# Description: USB ISO Creator
# Category: Utilities
# Author: Pete Batard
# License: GNU General Public License v3 - https://github.com/pbatard/rufus/blob/master/LICENSE.txt
# Version: 4.14
# Notes:

{% set version = '4.14' %}
{% set hash = '9fcad316c82ba3d0c3130c9f43fb0fe147e9eb62e1bf830716a0bbb6c58d24ee' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

rufus-download-only:
  file.managed:
    - name: '{{ downloads }}\rufus\rufus-{{ version }}.exe'
    - source: https://github.com/pbatard/rufus/releases/download/v{{ version }}/rufus-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
