# Name: Cutter
# Website: https://github.com/rizinorg/cutter
# Description: Reverse Engineering Platform powered by rizin
# Category: Executables
# Author: Rizin Organization
# License: GNU General Public License v3 (https://github.com/rizinorg/cutter/blob/dev/COPYING)
# Version: 2.5.0
# Notes: 

{% set version = '2.5.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'cutter-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\cutter\\' + pkg) %}

{% if exists %}

cutter-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\cutter\{{ pkg }}'
    - enforce_toplevel: False

cutter-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\cutter'
    - source: '{{ inpath }}\cutter-v{{ version }}-Windows-x86_64\'
    - force: True
    - makedirs: True
    - require:
      - archive: cutter-extract-offline

cutter-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Cutter.lnk'
    - target: '{{ inpath }}\cutter\cutter.exe'
    - force: True
    - working_dir: '{{ inpath }}\cutter\'
    - makedirs: True
    - require:
      - archive: cutter-extract-offline
      - file: cutter-folder-rename-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
