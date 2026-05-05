# Name: Rufus
# Website: https://rufus.ie
# Description: USB ISO Creator
# Category: Utilities
# Author: Pete Batard
# License: GNU General Public License v3 - https://github.com/pbatard/rufus/blob/master/LICENSE.txt
# Version: 4.14
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '4.14' %}
{% set hash = '9fcad316c82ba3d0c3130c9f43fb0fe147e9eb62e1bf830716a0bbb6c58d24ee' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

rufus-download:
  file.managed:
    - name: '{{ inpath }}\rufus\rufus.exe'
    - source: 'https://github.com/pbatard/rufus/releases/download/v{{ version }}/rufus-{{ version }}.exe'
    - source_hash: sha256={{ hash }}
    - makedirs: True

standalones-rufus-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Rufus.lnk'
    - target: '{{ inpath }}\rufus\rufus.exe'
    - force: True
    - working_dir: '{{ inpath }}\rufus\'
    - makedirs: True
    - require:
      - file: rufus-download
