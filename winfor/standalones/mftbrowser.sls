# Name: MFT Browser
# Website: https://github.com/kacos2000/MFT_Browser
# Description: Graphical MFT Browser utility
# Category: Windows Analysis
# Author: Costas K.
# License: MIT License (https://github.com/kacos2000/MFT_Browser/blob/master/LICENSE)
# Version: 0.0.68.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.0.68.0' %}
{% set hash = '31FBAEC90F1ECEE69825DB27E7D99E3C7A9D0BDF731F0058D7EFF9CA0602A47F' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

mftbrowser-download:
  file.managed:
    - name: '{{ inpath }}\mftbrowser\MFTBrowser.exe'
    - source: https://github.com/kacos2000/MFT_Browser/releases/download/v.{{ version }}/MFTBrowser.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

winfor-standalones-mftbrowser-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MFTBrowser.lnk'
    - target: '{{ inpath }}\mftbrowser\MFTBrowser.exe'
    - force: True
    - working_dir: '{{ inpath }}\mftbrowser\'
    - makedirs: True
    - require:
      - file: mftbrowser-download
