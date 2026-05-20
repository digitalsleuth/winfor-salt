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

include:
  - winfor.config.shims

bintext-download:
  file.managed:
    - name: 'C:\salt\tempdownload\bintext303.zip'
    - source: salt://winfor/files/bintext303.zip
    - makedirs: True

bintext-extract:
  archive.extracted:
    - name: {{ inpath }}\bintext\
    - source: 'C:\salt\tempdownload\bintext303.zip'
    - enforce_toplevel: False
    - require:
      - file: bintext-download

bintext-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\bintext\bintext.exe -OutPath {{ inpath }}\shims\bintext.exe'
    - require:
      - sls: winfor.config.shims

standalones-bintext-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\BinText.lnk'
    - target: {{ inpath }}\bintext\bintext.exe
    - force: True
    - working_dir: {{ inpath }}\bintext\
    - makedirs: True
    - require:
      - archive: bintext-extract
