# Name: FTK Imager
# Website: https://www.exterro.com
# Description: Forensic Image Acquisition and Triage tool
# Category: Acquisition and Analysis
# Author: Exterro Inc / AccessData
# License: EULA
# Version: 4.7.1.2
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ftk-imager-zip:
  archive.extracted:
    - name: 'C:\Program Files\AccessData\'
    - source: salt://winfor/files/FTK-Imager-4-7-1-2-portable.zip

ftk-imager-icon-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\FTK Imager.lnk'
    - target: 'C:\Program Files\AccessData\FTK Imager\FTK Imager.exe'
    - force: True
    - working_dir: 'C:\Program Files\AccessData\FTK Imager\'
    - makedirs: True
    - require:
      - archive: ftk-imager-zip
