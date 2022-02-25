# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

malcat-download:
  file.managed:
    - name: 'C:\salt\tempdownload\malcat_win64_lite.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256=66b1a7724fe8ba73471545b8ebb7a65ab01f060056e47d40f3819731b7804de6
    - makedirs: True

malcat-extract:
  archive.extracted:
    - name: 'C:\standalone\malcat'
    - source: 'C:\salt\tempdownload\malcat_win64_lite.zip'
    - enforce_toplevel: False
    - require:
      - file: malcat-download

malcat-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MalCat.lnk'
    - target: 'C:\standalone\malcat\bin\malcat.exe'
    - force: True
    - working_dir: 'C:\standalone\malcat\bin\'
    - makedirs: True
    - require:
      - file: malcat-download
      - archive: malcat-extract
