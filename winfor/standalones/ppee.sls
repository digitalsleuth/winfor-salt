# Name: PPEE (puppy)
# Website: https://www.mzrst.com/
# Description: Professional PE file Explorer
# Category: Executables
# Author: Zaderostam
# License: 
# Version: 1.13.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.13.1' %}
{% set hash = 'b82a1cd2753bd7986aa260abc5dbfdea1c9ab1de89fbdc929ea456c17e71ce1a' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ppee-download:
  file.managed:
    - name: 'C:\salt\tempdownload\PPEE(puppy)_{{ version }}.zip'
    - source: https://www.mzrst.com/puppy/PPEE(puppy)%20{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

ppee-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\PPEE(puppy)_{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: ppee-download

ppee-folder-rename:
  file.rename:
    - name: '{{ inpath }}\ppee'
    - source: '{{ inpath }}\PPEE(puppy) {{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: ppee-extract

standalones-ppee-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PPEE.lnk'
    - target: '{{ inpath }}\ppee\PPEE.exe'
    - force: True
    - working_dir: '{{ inpath }}\ppee\'
    - makedirs: True
    - require:
      - file: ppee-download
      - archive: ppee-extract
