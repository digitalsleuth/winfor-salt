# Name: photorec / testdisk
# Website: https://www.cgsecurity.org/
# Description: Raw data parsing tool
# Category: Raw Parsers / Decoders
# Author: Christophe Grenier
# License: GNU General Public License v2.0 (https://git.cgsecurity.org/cgit/testdisk/tree/COPYING)
# Version: 7.2
# Notes:

{% set version = '7.2' %}
{% set hash = 'e97e203ce77b6b1a3a37d01beccf069dc6c4632b579ffbb82ae739cdda229f38' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

testdisk-download:
  file.managed:
    - name: 'C:\salt\tempdownload\testdisk-{{ version }}.win64.zip'
    - source: https://www.cgsecurity.org/testdisk-{{ version }}.win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

testdisk-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\testdisk-{{ version }}.win64.zip'
    - enforce_toplevel: False
    - require:
      - file: testdisk-download

testdisk-folder-rename:
  file.rename:
    - name: '{{ inpath }}\testdisk'
    - source: '{{ inpath }}\testdisk-{{ version }}'
    - force: True
    - require:
      - archive: testdisk-extract

testdisk-env:
  win_path.exists:
    - name: '{{ inpath }}\testdisk'

qphotorec-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\QPhotoRec.lnk'
    - target: '{{ inpath }}\testdisk\qphotorec_win.exe'
    - force: True
    - working_dir: '{{ inpath }}\testdisk\'
    - makedirs: True
    - require:
      - file: testdisk-download
      - archive: testdisk-extract
      - file: testdisk-folder-rename

photorec-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PhotoRec.lnk'
    - target: '{{ inpath }}\testdisk\photorec_win.exe'
    - force: True
    - working_dir: '{{ inpath }}\testdisk\'
    - makedirs: True
    - require:
      - file: testdisk-download
      - archive: testdisk-extract
      - file: testdisk-folder-rename

testdisk-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\TestDisk.lnk'
    - target: '{{ inpath }}\testdisk\testdisk_win.exe'
    - force: True
    - working_dir: '{{ inpath }}\testdisk\'
    - makedirs: True
    - require:
      - file: testdisk-download
      - archive: testdisk-extract
      - file: testdisk-folder-rename
