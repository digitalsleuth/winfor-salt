# Name: NTFS Log Tracker
# Website: https://sites.google.com/site/forensicnote/ntfs-log-tracker
# Description: NTFS $LogFile, $UsnJrnl:$J parser
# Category: Windows Analysis
# Author: Junghoon Oh (blueangel)
# License: 
# Version: 1.9
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.9' %}
{% set hash = 'd3fe901af56c102d7ff7daf294a6d36f0c925d12c0f9ee6d28022b351d26c6a1' %}

ntfs-log-tracker-download-only:
  file.managed:
    - name: '{{ downloads }}\ntfs-log-tracker\ntfs-log-tracker-v{{ version }}.zip'
    - source: 'https://drive.usercontent.google.com/download?id=16Xnj8NNbBweMwokQ0PTO2-hQcOlN_4gS&export=download'
    - source_hash: sha256={{ hash }}
    - makedirs: True
