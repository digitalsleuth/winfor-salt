# Name: Total PE 2
# Website: https://github.com/zodiacon/TotalPE2
# Description: PE Viewer
# Category: Executables
# Author: Pavel Yosifovich
# License: MIT License (https://github.com/zodiacon/TotalPE2/blob/master/LICENSE.txt)
# Version: 0.7.0.0
# Notes: 

{% set version = '0.7.0.0' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'total-pe-2-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\total-pe-2\\' + pkg) %}

{% if exists %}
total-pe-2-rename-folder-offline:
  file.rename:
    - name: '{{ inpath }}\total-pe-2'
    - source: '{{ downloads }}\total-pe-2\'
    - makedirs: True
    - force: True

total-pe-2-rename-file-offline:
  file.rename:
    - name: '{{ inpath }}\total-pe-2\TotalPE.exe'
    - source: '{{ downloads }}\total-pe-2\{{ pkg }}'
    - makedirs: True
    - force: True

total-pe-2-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Total PE 2.lnk'
    - target: '{{ inpath }}\total-pe-2\TotalPE.exe'
    - force: True
    - working_dir: '{{ inpath }}\total-pe-2\'
    - makedirs: True
    - require:
      - file: total-pe-2-rename-folder-offline
      - file: total-pe-2-rename-file-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
