# Name: Bintext
# Website: https://mcafee.com
# Description: Finds Ascii, Unicode, and Resource strings in a file
# Category: Executables
# Author: Mcafee
# License: Free
# Version: 3.03
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

bintext-download:
  file.managed:
    - name: 'C:\salt\tempdownload\bintext303.zip'
    - source: salt://winfor/files/bintext303.zip
    - source_hash: sha256=eb1f2cdd3b8dea931b2fcc13a6ee4c4daad26826fa7db26f9e4f82e7f7b26743
    - makedirs: True

bintext-extract:
  archive.extracted:
    - name: {{ inpath }}\bintext\'
    - source: 'C:\salt\tempdownload\bintext303.zip'
    - enforce_toplevel: False
    - require:
      - file: bintext-download

bintext-env-vars:
  win_path.exists:
    - name: {{ inpath }}\bintext\'

standalones-bintext-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\BinText.lnk'
    - target: {{ inpath }}\bintext\bintext.exe'
    - force: True
    - working_dir: {{ inpath }}\bintext\'
    - makedirs: True
    - require:
      - archive: bintext-extract
