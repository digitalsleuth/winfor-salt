# Name: Brimor Labs Cerdapelta
# Website: https://www.brimorlabs.com/tools/
# Description: Incident Response Artifact Parser and Extractor
# Category: Automated tool that collects volatile data from Windows, OSX/macOS, and *nix based operating systems
# Author: Brian Moran
# Version: 20190905
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '2c32984adf2b5b584761f61bd58b61dfc0c62b27b117be40617fa260596d9c63' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

cerdapelta-download:
  file.managed:
    - name: 'C:\salt\tempdownload\LiveResponseCollection-Cedarpelta.zip'
    - source: https://www.brimorlabs.com/Tools/LiveResponseCollection-Cedarpelta.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

cerdapelta-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload'
    - source: 'C:\salt\tempdownload\LiveResponseCollection-Cedarpelta.zip'
    - enforce_toplevel: False
    - require:
      - file: cerdapelta-download

cerdapelta-folder-move:
  file.rename:
    - name: '{{ inpath }}\kape'
    - source: 'C:\salt\tempdownload\LiveResponseCollection-Cedarpelta\'
    - force: True
    - makedirs: True
    - require:
      - archive: cerdapelta-extract

cerdapelta-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\LiveResponseCollection-Cedarpelta\'

standalones-cerdapelta-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Cerdapelta.lnk'
    - target: '{{ inpath }}\LiveResponseCollection-Cedarpelta\Windows_Live_Response\Windows Live Response Collection.exe'
    - force: True
    - working_dir: '{{ inpath }}\LiveResponseCollection-Cedarpelta\Windows_Live_Response\'
    - makedirs: True
    - require:
      - file: cerdapelta-folder-move
