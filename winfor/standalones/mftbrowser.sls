# Name: MFT Browser
# Website: https://github.com/kacos2000/MFT_Browser
# Description: Graphical MFT Browser utility
# Category: Windows Analysis
# Author: Costas K.
# License: MIT License (https://github.com/kacos2000/MFT_Browser/blob/master/LICENSE)
# Version: 1.0.72.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.0.72.0' %}
{% set hash = '65c36420e2db2f3d4a068bc905f6b788c9376736b183c94e9893cb00a5d53119' %}
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
