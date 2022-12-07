# Name: myAutToExe
# Website: https://github.com/dzzie/myaut_contrib
# Description: AutoIT installer extractor
# Category: Installers
# Author: David Zimmer (dzzie)
# License: 
# Version: 2.12
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

myaut2exe-download:
  file.managed:
    - name: 'C:\standalone\myAutToExe\myAutToExe.exe'
    - source: https://github.com/dzzie/myaut_contrib/raw/master/myAutToExe.exe
    - source_hash: sha256=c61c8d1424849aad8d96da0c002d1df6a9224d7ddde8b16808ba3442371b3a62
    - makedirs: True

winfor-standalones-myaut2exe-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\myAutToExe.lnk'
    - target: 'C:\standalone\myAutToExe\myAutToExe.exe'
    - force: True
    - working_dir: 'C:\standalone\myAutToExe\'
    - makedirs: True
    - require:
      - file: myaut2exe-download
