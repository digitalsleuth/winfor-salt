# Name: NTFS Log Tracker
# Website: https://sites.google.com/site/forensicnote/ntfs-log-tracker
# Description: NTFS $LogFile, $UsnJrnl:$J parser
# Category: Windows Analysis
# Author: Junghoon Oh (blueangel)
# License: 
# Version: 1.71
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ntfs-log-tracker-download-only:
  file.managed:
    - name: '{{ downloads }}\ntfs-log-tracker\ntfs-log-tracker-v1.71.zip'
    - source: 'https://drive.google.com/uc?id=1ZmVbRiY3ijP_jAMv6sZPpNNxPIS3gmlM&export=download'
    - source_hash: sha256=b9fd01c583e9f41116b3800933ba7aca2196996cdab4c3035ae182f907fb3a81
    - makedirs: True
