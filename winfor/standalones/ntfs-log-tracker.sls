# Name: NTFS Log Tracker
# Website: https://sites.google.com/site/forensicnote/ntfs-log-tracker
# Description: NTFS $LogFile, $UsnJrnl:$J parser
# Category: Windows Analysis
# Author: Junghoon Oh (blueangel)
# License: 
# Version: 1.71
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ntfs-log-tracker-download:
  file.managed:
    - name: 'C:\salt\tempdownload\ntfs-log-tracker-v1.71.zip'
    - source: 'https://drive.google.com/uc?id=1ZmVbRiY3ijP_jAMv6sZPpNNxPIS3gmlM&export=download'
    - source_hash: sha256=b9fd01c583e9f41116b3800933ba7aca2196996cdab4c3035ae182f907fb3a81
    - makedirs: True

ntfs-log-tracker-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\ntfs-log-tracker-v1.71.zip'
    - enforce_toplevel: False
    - watch:
      - file: ntfs-log-tracker-download

ntfs-log-tracker-folder-rename:
  file.rename:
    - name: '{{ inpath }}\ntfs-log-tracker'
    - source: '{{ inpath }}\NTFS Log Tracker v1.71\'
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
    - target: '{{ inpath }}\ntfs-log-tracker\NTFS Log Tracker v1.71.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntfs-log-tracker\'
    - makedirs: True
    - require:
      - file: ntfs-log-tracker-download
      - archive: ntfs-log-tracker-extract
