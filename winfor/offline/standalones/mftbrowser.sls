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
{% set pkg = 'mftbrowser-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\mftbrowser\\' + pkg) %}

{% if exists %}

mftbrowser-offline:
  file.managed:
    - name: '{{ inpath }}\mftbrowser\MFTBrowser.exe'
    - source: '{{ downloads }}\mftbrowser\{{ pkg }}'
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

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
