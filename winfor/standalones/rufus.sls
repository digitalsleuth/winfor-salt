# Name: Rufus
# Website: https://rufus.ie
# Description: USB ISO Creator
# Category: Utilities
# Author: Pete Batard
# License: GNU General Public License v3 - https://github.com/pbatard/rufus/blob/master/LICENSE.txt
# Version: 4.2
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '4.2' %}
{% set hash = 'c8420cf0f9f5e9a413865a34d998c6e56617cece45b2fb9f92dc28615bcc0ed7' %}
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
