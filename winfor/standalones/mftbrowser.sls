# Name: MFT Browser
# Website: https://github.com/kacos2000/MFT_Browser
# Description: Graphical MFT Browser utility
# Category: Windows Analysis
# Author: Costas K.
# License: MIT License (https://github.com/kacos2000/MFT_Browser/blob/master/LICENSE)
# Version: 1.0.80
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.0.80' %}
{% set hash = '478bb7ee1f6b33caeae9bc39298a12ccc3f99834a550cfaff5b7848a7dcc9b0b' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

mftbrowser-download:
  file.managed:
    - name: '{{ inpath }}\mftbrowser\MFTBrowser.exe'
    - source: https://github.com/kacos2000/MFT_Browser/releases/download/v.{{ version }}/MFTBrowser.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

standalones-mftbrowser-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MFTBrowser.lnk'
    - target: '{{ inpath }}\mftbrowser\MFTBrowser.exe'
    - force: True
    - working_dir: '{{ inpath }}\mftbrowser\'
    - makedirs: True
    - require:
      - file: mftbrowser-download
