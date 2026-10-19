# Name: LogParser Studio
# Website: https://techcommunity.microsoft.com/gxcuf89792/attachments/gxcuf89792/Exchange/16744/1/LPSV2.D2.zip?WT.mc_id=M365-MVP-5002016
# Description: Graphical interface for Microsoft's log parser
# Category: Logs
# Author: Microsoft
# License: 
# Version: 2.0.0.100
# Notes: 

{% set version = '2.0.0.100' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('logparser-studio') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

logparser-studio-download-only:
  file.managed:
    - name: '{{ downloads }}\logparser-studio\logparser-studio-{{ version }}.zip'
    - source: https://techcommunity.microsoft.com/gxcuf89792/attachments/gxcuf89792/Exchange/16744/1/LPSV2.D2.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
