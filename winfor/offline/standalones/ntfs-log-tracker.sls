# Name: NTFS Log Tracker
# Website: https://sites.google.com/site/forensicnote/ntfs-log-tracker
# Description: NTFS $LogFile, $UsnJrnl:$J parser
# Category: Windows Analysis
# Author: Junghoon Oh (blueangel)
# License: 
# Version: 1.9
# Notes: 

{% set version = '1.9' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'ntfs-log-tracker-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\ntfs-log-tracker\\' + pkg) %}

{% if exists %}

ntfs-log-tracker-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\ntfs-log-tracker\'
    - source: '{{ downloads }}\ntfs-log-tracker\{{ pkg }}'
    - enforce_toplevel: False

ntfs-log-tracker-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\ntfs-log-tracker'
    - source: '{{ inpath }}\NTFS Log Tracker v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: ntfs-log-tracker-extract-offline

ntfs-log-tracker-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NTFS Log Tracker.lnk'
    - target: '{{ inpath }}\ntfs-log-tracker\NTFS_Log_Tracker.exe'
    - force: True
    - working_dir: '{{ inpath }}\ntfs-log-tracker\'
    - makedirs: True
    - require:
      - archive: ntfs-log-tracker-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
