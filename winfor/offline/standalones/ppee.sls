# Name: PPEE (puppy)
# Website: https://www.mzrst.com/
# Description: Professional PE file Explorer
# Category: Executables
# Author: Zaderostam
# License: 
# Version: 1.13.1
# Notes: 

{% set version = '1.13.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ppee-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\ppee\PPEE(puppy)_{{ version }}.zip'
    - enforce_toplevel: False

ppee-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\ppee'
    - source: '{{ inpath }}\PPEE(puppy) {{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: ppee-extract-offline

ppee-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PPEE.lnk'
    - target: '{{ inpath }}\ppee\PPEE.exe'
    - force: True
    - working_dir: '{{ inpath }}\ppee\'
    - makedirs: True
    - require:
      - archive: ppee-extract-offline
