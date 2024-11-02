# Name: NTFS Log Tracker
# Website: https://sites.google.com/site/forensicnote/ntfs-log-tracker
# Description: NTFS $LogFile, $UsnJrnl:$J parser
# Category: Windows Analysis
# Author: Junghoon Oh (blueangel)
# License: 
# Version: 1.71
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.71' %}
{% set hash = '87046624daec5c64676e3c7f9821e0d9651dd9782b62ca11bc04a192500a9063' %}

ntfs-log-tracker-download-only:
  file.managed:
    - name: '{{ downloads }}\ntfs-log-tracker\ntfs-log-tracker-v{{ version }}.zip'
    - source: 'https://drive.google.com/uc?id=1ZmVbRiY3ijP_jAMv6sZPpNNxPIS3gmlM&export=download'
    - source_hash: sha256={{ hash }}
    - makedirs: True
