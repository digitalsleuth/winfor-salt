# Name: Brimor Labs Cedarpelta
# Website: https://www.brimorlabs.com/tools/
# Description: Incident Response Artifact Parser and Extractor
# Category: Automated tool that collects volatile data from Windows, OSX/macOS, and *nix based operating systems
# Author: Brian Moran
# Version: 20190905
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '2c32984adf2b5b584761f61bd58b61dfc0c62b27b117be40617fa260596d9c63' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

cedarpelta-download:
  file.managed:
    - name: 'C:\salt\tempdownload\LiveResponseCollection-Cedarpelta.zip'
    - source: https://www.brimorlabs.com/Tools/LiveResponseCollection-Cedarpelta.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

cedarpelta-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload'
    - source: 'C:\salt\tempdownload\LiveResponseCollection-Cedarpelta.zip'
    - enforce_toplevel: False
    - require:
      - file: cedarpelta-download

cedarpelta-folder-move:
  file.rename:
    - name: '{{ inpath }}\cedarpelta'
    - source: 'C:\salt\tempdownload\LiveResponseCollection-Cedarpelta\'
    - force: True
    - makedirs: True
    - require:
      - archive: cedarpelta-extract

cedarpelta-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\cedarpelta\'

standalones-cedarpelta-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Cedarpelta.lnk'
    - target: '{{ inpath }}\cedarpelta\Windows_Live_Response\Windows Live Response Collection.exe'
    - force: True
    - working_dir: '{{ inpath }}\cedarpelta\Windows_Live_Response\'
    - makedirs: True
    - require:
      - file: cedarpelta-folder-move
