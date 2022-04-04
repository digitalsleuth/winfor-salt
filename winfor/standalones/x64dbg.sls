# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = '2022-01-13_04-25' %}
{% set hash = 'ef853316e5ea0ecb7c1b3ec340549c0fc92cb8cf52f462287dcc517a124fcfb1' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

x64dbg-download:
  file.managed:
    - name: 'C:\salt\tempdownload\snapshot_{{ version }}.zip'
    - source: https://deac-ams.dl.sourceforge.net/project/x64dbg/snapshots/snapshot_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

x64dbg-extract:
  archive.extracted:
    - name: 'C:\standalone\x64dbg'
    - source: 'C:\salt\tempdownload\snapshot_{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: x64dbg-download

winfor-standalones-x64dbg-shortcut-1:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\x64dbg.lnk'
    - target: 'C:\standalone\x64dbg\release\x64\x64dbg.exe'
    - force: True
    - working_dir: 'C:\standalone\x64dbg\release\x64\'
    - makedirs: True
    - require:
      - file: x64dbg-download
      - archive: x64dbg-extract

winfor-standalones-x64dbg-shortcut-2:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\x32dbg.lnk'
    - target: 'C:\standalone\x64dbg\release\x32\x32dbg.exe'
    - force: True
    - working_dir: 'C:\standalone\x64dbg\release\x32'
    - makedirs: True
    - require:
      - file: x64dbg-download
      - archive: x64dbg-extract
