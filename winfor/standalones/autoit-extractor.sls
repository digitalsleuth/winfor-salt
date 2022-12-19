# Name: AutoIt Extractor
# Website: https://github.com/digitalsleuth/autoit-extractor
# Description: AutoIt installer extractor
# Category: Installers
# Author: x0r19x91 
# License: GNU General Public License v3.0
# Version: 1.0.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

autoit-extractor-download:
  file.managed:
    - name: '{{ inpath }}\autoit-extractor\autoit-extractor.exe'
    - source: 'https://github.com/digitalsleuth/autoit-extractor/raw/master/net40/AutoIt%20Extractor/bin/x64/Release/AutoIt%20Extractor.exe'
    - source_hash: sha256=d82d49e9ad153ef84670c1d0bde5f36b540d32fa037cca6127ce9e4e366b7403
    - makedirs: True

winfor-standalones-autoit-extractor-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\AutoIT Extractor.lnk'
    - target: '{{ inpath }}\autoit-extractor\autoit-extractor.exe'
    - force: True
    - working_dir: '{{ inpath }}\autoit-extractor\'
    - makedirs: True
    - require:
      - file: autoit-extractor-download
