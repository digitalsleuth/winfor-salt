# Name: FTK Imager
# Website: https://www.exterro.com
# Description: Forensic Image Acquisition and Triage tool
# Category: Acquisition and Analysis
# Author: Exterro Inc / AccessData
# License: EULA
# Version: 4.7.1.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.7.1.2' %}
{% set hash = '3f77a248732d5a8416365084b30006776cd0c0cda7b0ea462e4b3ffce2bcf88d' %}

ftk-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\ftk-imager\FTK-Imager-4-7-1-2-portable.zip'
    - source: https://github.com/digitalsleuth/winfor-salt/raw/main/winfor/files/FTK-Imager-4-7-1-2-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
