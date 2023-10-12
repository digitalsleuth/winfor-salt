# Name: Rufus
# Website: https://rufus.ie
# Description: USB ISO Creator
# Category: Utilities
# Author: Pete Batard
# License: GNU General Public License v3 - https://github.com/pbatard/rufus/blob/master/LICENSE.txt
# Version: 4.2
# Notes:

{% set version = '4.2' %}
{% set hash = 'c8420cf0f9f5e9a413865a34d998c6e56617cece45b2fb9f92dc28615bcc0ed7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

rufus-download-only:
  file.managed:
    - name: '{{ downloads }}\rufus\rufus-{{ version }}.exe'
    - source: https://github.com/pbatard/rufus/releases/download/v{{ version }}/rufus-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
