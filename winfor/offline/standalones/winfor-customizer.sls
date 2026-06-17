# Name: Win-FOR Customizer
# Website: https://github.com/digitalsleuth/win-for
# Description: GUI for the installation of Forensics Tools in a Windows Environment
# Category: Utilities
# Author: Corey Forman (digitalsleuth)
# License: MIT (https://github.com/digitalsleuth/WIN-FOR/blob/main/LICENSE)
# Version: 11.1.0
# Notes: 

{% set version = '11.1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

winfor-customizer-offline:
  file.managed:
    - name: '{{ inpath }}\win-for.exe'
    - source: '{{ downloads }}\winfor-customizer\winfor-v{{ version }}.exe'
    - skip_verify: True
    - makedirs: True
    - replace: False

winfor-customizer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Win-FOR.lnk'
    - target: '{{ inpath }}\win-for.exe'
    - force: True
    - working_dir: '{{ inpath }}\'
    - makedirs: True
    - require:
      - file: winfor-customizer-offline
