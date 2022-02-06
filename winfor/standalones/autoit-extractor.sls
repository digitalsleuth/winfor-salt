# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

autoit-extractor-download:
  file.managed:
    - name: 'C:\standalone\autoit-extractor\autoit-extractor.exe'
    - source: 'https://gitlab.com/suvaditya/autoit-extractor/-/raw/master/net40/AutoIt%20Extractor/bin/x64/Release/AutoIt%20Extractor.exe'
    - source_hash: sha256=d82d49e9ad153ef84670c1d0bde5f36b540d32fa037cca6127ce9e4e366b7403
    - makedirs: True

winfor-standalones-autoit-extractor-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\AutoIT Extractor.lnk'
    - target: 'C:\standalone\autoit-extractor\autoit-extractor.exe'
    - force: True
    - working_dir: 'C:\standalone\autoit-extractor\'
    - makedirs: True
    - require:
      - file: autoit-extractor-download
