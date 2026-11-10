# Name: PPEE (puppy)
# Website: https://www.mzrst.com/
# Description: Professional PE file Explorer
# Category: Executables
# Author: Zaderostam
# License: 
# Version: 1.16
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.16' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ppee') %}
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
