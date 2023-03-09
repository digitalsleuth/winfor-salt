# Name: Live Response Collection (Cedarpelta)
# Website: https://www.brimorlabs.com/tools/
# Description: Incident Response Artifact Parser and Extractor
# Category: Windows Analysis
# Author: Brian Moran
# License: GNU General Public License v3.0 (see COPYING in zip file)
# Version: Cedarpelta - 20190905
# Notes: Also does macOS and Linux collection

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '2c32984adf2b5b584761f61bd58b61dfc0c62b27b117be40617fa260596d9c63' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

lrc-cedarpelta-download:
  file.managed:
    - name: 'C:\salt\tempdownload\LiveResponseCollection-Cedarpelta.zip'
    - source: https://www.brimorlabs.com/Tools/LiveResponseCollection-Cedarpelta.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

lrc-cedarpelta-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\lrc-cedarpelta'
    - source: 'C:\salt\tempdownload\LiveResponseCollection-Cedarpelta.zip'
    - enforce_toplevel: False
    - require:
      - file: lrc-cedarpelta-download

lrc-cedarpelta-folder-move:
  file.rename:
    - name: '{{ inpath }}\lrc-cedarpelta'
    - source: 'C:\salt\tempdownload\lrc-cedarpelta'
    - force: True
    - makedirs: True
    - require:
      - archive: lrc-cedarpelta-extract

lrc-cedarpelta-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\lrc-cedarpelta\'

standalones-lrc-cedarpelta-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Live Response Collection - Cedarpelta.lnk'
    - target: '{{ inpath }}\lrc-cedarpelta\Windows_Live_Response\Windows Live Response Collection.exe'
    - force: True
    - working_dir: '{{ inpath }}\lrc-cedarpelta\Windows_Live_Response\'
    - makedirs: True
    - require:
      - file: lrc-cedarpelta-folder-move
