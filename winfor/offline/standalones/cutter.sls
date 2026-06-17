# Name: Cutter
# Website: https://github.com/rizinorg/cutter
# Description: Reverse Engineering Platform powered by rizin
# Category: Executables
# Author: Rizin Organization
# License: GNU General Public License v3 (https://github.com/rizinorg/cutter/blob/dev/COPYING)
# Version: 2.4.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '2.4.1' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

cutter-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\cutter\Cutter-v{{ version }}-Windows-x86_64.zip'
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
