# Name: DROID
# Website: https://www.nationalarchives.gov.uk/information-management/manage-information/preserving-digital-records/droid/
# Description: File Format Identification Tool
# Category: Raw Parsers / Decoders
# Author: The National Archives
# License: BSD License (https://raw.github.com/digital-preservation/droid/master/license.md)
# Version: 6.9.12
# Notes: Command Line and GUI, this will utilize the GUI by default

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '6.9.12' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

droid-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\droid\'
    - source: '{{ downloads }}\droid\droid-binary-{{ version }}-bin-win64-with-jre.zip'
    - overwrite: True
    - enforce_toplevel: False

droid-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DROID.lnk'
    - target: {{ inpath }}\droid\droid.bat
    - force: True
    - working_dir: {{ inpath }}\droid\
    - makedirs: True
    - require:
      - archive: droid-extract-offline

droid-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\droid\'
    - require:
      - archive: droid-extract-offline
