# Name: LogParser Studio
# Website: https://techcommunity.microsoft.com/gxcuf89792/attachments/gxcuf89792/Exchange/16744/1/LPSV2.D2.zip?WT.mc_id=M365-MVP-5002016
# Description: Graphical interface for Microsoft's log parser
# Category: Logs
# Author: Microsoft
# License: 
# Version: 2.0.0.100
# Notes: 

{% set hash = 'cf4e8fb1970230c0cb699324246d14b5406e284e566a1e06717d1b785b77c893' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.0.0.100' %}

logparser-studio-download-only:
  file.managed:
    - name: '{{ downloads }}\logparser-studio\LPSV2.D2-{{ version }}.zip'
    - source: https://techcommunity.microsoft.com/gxcuf89792/attachments/gxcuf89792/Exchange/16744/1/LPSV2.D2.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
