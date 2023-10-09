# Name: FEX Imager
# Website: https://getdataforensics.com
# Description: Physical and Logical Imaging Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 2.2.1.283
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAMFILES = salt['environ.get']('PROGRAMFILES') %}

fex-imager:
  pkg.installed

fex-imager-icon-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\FEX Imager.lnk'
    - target: '{{ PROGRAMFILES }}\GetData\FEX Imager\FEXImager.exe'
    - force: True
    - working_dir: '{{ PROGRAMFILES }}\GetData\FEX Imager\'
    - makedirs: True
    - require:
      - pkg: fex-imager
