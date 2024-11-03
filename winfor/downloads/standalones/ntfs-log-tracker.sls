# Name: NTFS Log Tracker
# Website: https://sites.google.com/site/forensicnote/ntfs-log-tracker
# Description: NTFS $LogFile, $UsnJrnl:$J parser
# Category: Windows Analysis
# Author: Junghoon Oh (blueangel)
# License: 
# Version: 1.8
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.8' %}
{% set hash = 'f53564a35a21d5e83ba4fb4e01e5fe4779de98d8f1d6934062046e83ece35ec6' %}

ntfs-log-tracker-download-only:
  file.managed:
    - name: '{{ downloads }}\ntfs-log-tracker\ntfs-log-tracker-v{{ version }}.zip'
    - source: 'https://drive.usercontent.google.com/download?id=1n6rDDEqUYx580CnTyU2w6L9Qj7qeqYJt&export=download'
    - source_hash: sha256={{ hash }}
    - makedirs: True
