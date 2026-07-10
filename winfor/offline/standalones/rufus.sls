# Name: Rufus
# Website: https://rufus.ie
# Description: USB ISO Creator
# Category: Utilities
# Author: Pete Batard
# License: GNU General Public License v3 - https://github.com/pbatard/rufus/blob/master/LICENSE.txt
# Version: 4.15
# Notes:

{% set version = '4.15' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'rufus-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\rufus\\' + pkg) %}

{% if exists %}

rufus-copy-offline:
  file.managed:
    - name: '{{ inpath }}\rufus\rufus.exe'
    - source: '{{ downloads }}\rufus\rufus-{{ version }}.exe'
    - skip_verify: True
    - makedirs: True

rufus-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Rufus.lnk'
    - target: '{{ inpath }}\rufus\rufus.exe'
    - force: True
    - working_dir: '{{ inpath }}\rufus\'
    - makedirs: True
    - require:
      - file: rufus-copy-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
