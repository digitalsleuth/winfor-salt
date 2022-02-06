# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

pe-bear-download:
  file.managed:
    - name: 'C:\salt\tempdownload\PE-bear_0.5.5.1_x64_win_vs17.zip'
    - source: https://github.com/hasherezade/pe-bear-releases/releases/download/0.5.5.1/PE-bear_0.5.5.1_x64_win_vs17.zip
    - source_hash: sha256=91c97724511b2b7acc32d07306ee0dff2684a60c60433f8ecdcbb647caff96d2
    - makedirs: True

pe-bear-extract:
  archive.extracted:
    - name: 'C:\standalone\pe-bear'
    - source: 'C:\salt\tempdownload\PE-bear_0.5.5.1_x64_win_vs17.zip'
    - enforce_toplevel: False
    - require:
      - file: pe-bear-download

pe-bear-sig-download:
  file.managed:
    - name: 'C:\standalone\pe-bear\SIG.txt'
    - source: https://github.com/hasherezade/pe-bear-releases/raw/master/SIG.txt
    - source_hash: sha256=df695de2d3ad1aa33aba123eaa756ca4be2620289dbf85b110d9e471c8865048
    - makedirs: True
    - require:
      - archive: pe-bear-extract

winfor-standalones-pe-bear-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PE-Bear.lnk'
    - target: 'C:\standalone\pe-bear\PE-bear.exe'
    - force: True
    - working_dir: 'C:\standalone\pe-bear\'
    - makedirs: True
    - require:
      - file: pe-bear-download
      - archive: pe-bear-extract
