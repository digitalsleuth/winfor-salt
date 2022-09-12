# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: 
# Author: 
# License: 
# Version: 9.42
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '335fd7702dded5687dc34fb3181334689921ac8c696b84c5cd988aec59c4c748' %}

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
