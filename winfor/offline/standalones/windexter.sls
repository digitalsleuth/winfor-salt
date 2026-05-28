# Name: Windexter
# Website: https://github.com/digitalsleuth/windexter
# Description: A Windows Search Index parser, written in C#
# Category: Windows Analysis
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/windexter/blob/main/LICENSE)
# Version: 1.0.2
# Notes:

{% set version = '1.0.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

windexter-offline:
  file.managed:
    - name: '{{ inpath }}\windexter\Windexter.exe'
    - source: '{{ downloads }}\windexter\Windexter-v{{ version }}.exe'
    - skip_verify: True
    - makedirs: True
    - force: True

windexter-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Windexter.lnk'
    - target: '{{ inpath }}\windexter\Windexter.exe'
    - force: True
    - working_dir: '{{ inpath }}\windexter\'
    - makedirs: True
    - require:
      - file: windexter-offline
