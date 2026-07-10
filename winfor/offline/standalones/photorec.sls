# Name: photorec / testdisk
# Website: https://www.cgsecurity.org/
# Description: Raw data parsing tool
# Category: Raw Parsers / Decoders
# Author: Christophe Grenier
# License: GNU General Public License v2.0 (https://git.cgsecurity.org/cgit/testdisk/tree/COPYING)
# Version: 7.2
# Notes:

{% set version = '7.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'testdisk-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\photorec\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

testdisk-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\photorec\{{ pkg }}'
    - enforce_toplevel: False

testdisk-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\testdisk'
    - source: '{{ inpath }}\testdisk-{{ version }}'
    - force: True
    - require:
      - archive: testdisk-extract-offline

photorec-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\testdisk\photorec_win.exe -OutPath {{ inpath }}\shims\photorec.exe'
    - require:
      - sls: winfor.config.shims

testdisk-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\testdisk\testdisk_win.exe -OutPath {{ inpath }}\shims\testdisk.exe'
    - require:
      - sls: winfor.config.shims

qphotorec-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\QPhotoRec.lnk'
    - target: '{{ inpath }}\testdisk\qphotorec_win.exe'
    - force: True
    - working_dir: '{{ inpath }}\testdisk\'
    - makedirs: True
    - require:
      - archive: testdisk-extract-offline
      - file: testdisk-folder-rename-offline

photorec-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PhotoRec.lnk'
    - target: '{{ inpath }}\testdisk\photorec_win.exe'
    - force: True
    - working_dir: '{{ inpath }}\testdisk\'
    - makedirs: True
    - require:
      - archive: testdisk-extract-offline
      - file: testdisk-folder-rename-offline

testdisk-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\TestDisk.lnk'
    - target: '{{ inpath }}\testdisk\testdisk_win.exe'
    - force: True
    - working_dir: '{{ inpath }}\testdisk\'
    - makedirs: True
    - require:
      - archive: testdisk-extract-offline
      - file: testdisk-folder-rename-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
