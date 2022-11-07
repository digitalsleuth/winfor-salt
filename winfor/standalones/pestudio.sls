# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: 
# Author: 
# License: 
# Version: 9.42
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '0b5605b47a75c10f0988928979e1b8730ef85e876c4f6276a09d04ab1a96833e' %}

pestudio-download:
  file.managed:
    - name: 'C:\salt\tempdownload\pestudio.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

pestudio-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\pestudio.zip'
    - enforce_toplevel: False
    - require:
      - file: pestudio-download

pestudio-env-vars:
  win_path.exists:
    - name: 'C:\standalone\pestudio\'

winfor-standalones-pestudio-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PEStudio.lnk'
    - target: 'C:\standalone\pestudio\pestudio.exe'
    - force: True
    - working_dir: 'C:\standalone\pestudio\'
    - makedirs: True
    - require:
      - file: pestudio-download
      - archive: pestudio-extract
