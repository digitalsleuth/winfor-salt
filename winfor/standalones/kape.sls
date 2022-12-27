# Name: kape
# Website: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Description: Incident Response Artifact Parser and Extractor
# Category: Windows Analysis
# Author: Eric Zimmerman / Kroll
# License: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Version: 1.3.0.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.3.0.0' %}
{% set hash = '564022CA68806AD8A1DF105DB460ADE87FE07E457BCAEC467A6A92017DEB37E9' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

kape-download:
  file.managed:
    - name: 'C:\salt\tempdownload\kape.zip'
    - source: https://s3.amazonaws.com/cyb-us-prd-kape/kape.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

kape-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload'
    - source: 'C:\salt\tempdownload\kape.zip'
    - enforce_toplevel: False
    - require:
      - file: kape-download

kape-folder-move:
  file.rename:
    - name: '{{ inpath }}\kape'
    - source: 'C:\salt\tempdownload\KAPE\'
    - force: True
    - makedirs: True
    - require:
      - archive: kape-extract

kape-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\kape\'

winfor-standalones-gkape-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\gkape.lnk'
    - target: '{{ inpath }}\kape\gkape.exe'
    - force: True
    - working_dir: '{{ inpath }}\kape\'
    - makedirs: True
    - require:
      - file: kape-folder-move
