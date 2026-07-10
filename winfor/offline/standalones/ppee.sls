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
{% set pkg = 'ppee-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\ppee\\' + pkg) %}

{% if exists %}

ppee-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\ppee\{{ pkg }}'
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

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
