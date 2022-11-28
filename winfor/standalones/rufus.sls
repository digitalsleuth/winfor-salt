# Name: Rufus
# Website: https://rufus.ie
# Description: USB ISO Creator
# Category: Utilities
# Author: Pete Batard
# License: GNU General Public License v3 - https://github.com/pbatard/rufus/blob/master/LICENSE.txt
# Version: 3.20
# Notes:

{% set version = '3.20' %}
{% set hash = '042f0b284af6e3316baf6235a4f0141966a051873b5631c7e5a724cf1f5e7973' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

rufus-download:
  file.managed:
    - name: 'C:\standalone\rufus\rufus-{{ version }}.exe'
    - source: 'https://github.com/pbatard/rufus/releases/download/v{{ version }}/rufus-{{ version }}.exe'
    - source_hash: sha256={{ hash }}
    - makedirs: True

winfor-standalones-rufus-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Rufus.lnk'
    - target: 'C:\standalone\rufus\rufus-{{ version }}.exe'
    - force: True
    - working_dir: 'C:\standalone\rufus\'
    - makedirs: True
    - require:
      - file: rufus-download
