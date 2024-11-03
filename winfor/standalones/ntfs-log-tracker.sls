# Name: NTFS Log Tracker
# Website: https://sites.google.com/site/forensicnote/ntfs-log-tracker
# Description: NTFS $LogFile, $UsnJrnl:$J parser
# Category: Windows Analysis
# Author: Junghoon Oh (blueangel)
# License: 
# Version: 1.8
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = 'f53564a35a21d5e83ba4fb4e01e5fe4779de98d8f1d6934062046e83ece35ec6' %}
{% set version = '1.8' %}

ntfs-log-tracker-download:
  file.managed:
    - name: 'C:\salt\tempdownload\ntfs-log-tracker-v{{ version }}.zip'
    - source: 'https://drive.usercontent.google.com/download?id=1n6rDDEqUYx580CnTyU2w6L9Qj7qeqYJt&export=download'
    - source_hash: sha256={{ hash }}
    - makedirs: True

ntfs-log-tracker-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\ntfs-log-tracker-v{{ version }}.zip'
    - enforce_toplevel: False
    - watch:
      - file: ntfs-log-tracker-download

ntfs-log-tracker-folder-rename:
  file.rename:
    - name: '{{ inpath }}\ntfs-log-tracker'
    - source: '{{ inpath }}\NTFS Log Tracker v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: ntfs-log-tracker-extract

ntfs-log-tracker-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\ntfs-log-tracker\'

standalones-ntfs-log-tracker-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NTFS Log Tracker.lnk'
    - target: '{{ inpath }}\ntfs-log-tracker\NTFS Log Tracker v{{ version }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntfs-log-tracker\'
    - makedirs: True
    - require:
      - file: ntfs-log-tracker-download
      - archive: ntfs-log-tracker-extract
