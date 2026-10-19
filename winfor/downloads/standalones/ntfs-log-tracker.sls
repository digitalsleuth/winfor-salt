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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ntfs-log-tracker') %}

ntfs-log-tracker-download-only:
  file.managed:
    - name: '{{ downloads }}\ntfs-log-tracker\ntfs-log-tracker-{{ version }}.zip'
    - source: 'https://drive.usercontent.google.com/download?id=16Xnj8NNbBweMwokQ0PTO2-hQcOlN_4gS&export=download'
    - source_hash: sha256={{ hash }}
    - makedirs: True
