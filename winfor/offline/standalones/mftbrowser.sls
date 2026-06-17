# Name: MFT Browser
# Website: https://github.com/kacos2000/MFT_Browser
# Description: Graphical MFT Browser utility
# Category: Windows Analysis
# Author: Costas K.
# License: MIT License (https://github.com/kacos2000/MFT_Browser/blob/master/LICENSE)
# Version: 1.0.80
# Notes:

{% set version = '1.0.80' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

mftbrowser-offline:
  file.managed:
    - name: '{{ inpath }}\mftbrowser\MFTBrowser.exe'
    - source: {{ downloads }}\mftbrowser\MFTBrowser-{{ version }}.exe
    - skip_verify: True
    - makedirs: True

mftbrowser-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MFTBrowser.lnk'
    - target: '{{ inpath }}\mftbrowser\MFTBrowser.exe'
    - force: True
    - working_dir: '{{ inpath }}\mftbrowser\'
    - makedirs: True
    - require:
      - file: mftbrowser-offline
