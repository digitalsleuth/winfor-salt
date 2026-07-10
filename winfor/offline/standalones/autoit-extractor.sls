# Name: AutoIt Extractor
# Website: https://github.com/digitalsleuth/autoit-extractor
# Description: AutoIt installer extractor
# Category: Installers
# Author: x0r19x91 
# License: GNU General Public License v3.0
# Version: 1.0.0
# Notes: 

{% set version = '1.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'autoit-extractor-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\autoit-extractor\\' + pkg) %}

{% if exists %}

autoit-extractor-offline:
  file.managed:
    - name: '{{ inpath }}\autoit-extractor\autoit-extractor.exe'
    - source: '{{ downloads }}\autoit-extractor\autoit-extractor-{{ version }}.exe'
    - skip_verify: True
    - makedirs: True

autoit-extractor-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\AutoIT Extractor.lnk'
    - target: '{{ inpath }}\autoit-extractor\autoit-extractor.exe'
    - force: True
    - working_dir: '{{ inpath }}\autoit-extractor\'
    - makedirs: True
    - require:
      - file: autoit-extractor-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
