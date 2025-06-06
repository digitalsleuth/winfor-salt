# Name: Win-FOR Customizer
# Website: https://github.com/digitalsleuth/win-for
# Description: GUI for the installation of Forensics Tools in a Windows Environment
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT (https://github.com/digitalsleuth/WIN-FOR/blob/main/LICENSE)
# Version: 10.2.0
# Notes: 

{% set version = '10.2.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

winfor-customizer-download:
  file.managed:
    - name: '{{ inpath }}\winfor-customizer-v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/WIN-FOR/releases/download/v{{ version }}/winfor-customizer-v{{ version }}.exe
    - skip_verify: True
    - makedirs: True
    - replace: False

winfor-customizer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Win-FOR Customizer.lnk'
    - target: '{{ inpath }}\winfor-customizer-v{{ version }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\'
    - makedirs: True
    - require:
      - file: winfor-customizer-download
