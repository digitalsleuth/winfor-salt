# Name: DROID
# Website: https://www.nationalarchives.gov.uk/information-management/manage-information/preserving-digital-records/droid/
# Description: File Format Identification Tool
# Category: Raw Parsers / Decoders
# Author: The National Archives
# License: BSD License (https://raw.github.com/digital-preservation/droid/master/license.md)
# Version: 6.9.3
# Notes: Command Line and GUI, this will utilize the GUI by default, updates signature database on install

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '6.9.3' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '43ea56f3573804542967fa5a1ef46f0632ff6c8fc75b35dacacd17c751ed7abb' %}

droid-download:
  file.managed:
    - name: 'C:\salt\tempdownload\droid-binary-{{ version }}-bin-win64-with-jre.zip'
    - source: https://github.com/digital-preservation/droid/releases/download/{{ version }}/droid-binary-{{ version }}-bin-win64-with-jre.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

droid-extract:
  archive.extracted:
    - name: '{{ inpath }}\droid\'
    - source: 'C:\salt\tempdownload\droid-binary-{{ version }}-bin-win64-with-jre.zip'
    - overwrite: True
    - enforce_toplevel: False
    - require:
      - file: droid-download

droid-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DROID.lnk'
    - target: {{ inpath }}\droid\droid.bat
    - force: True
    - working_dir: {{ inpath }}\droid\
    - makedirs: True
    - require:
      - archive: droid-extract

droid-signature-update:
  cmd.run:
    - name: '{{ inpath }}\droid\jre\bin\java.exe -jar {{ inpath }}\droid\droid-command-line-{{ version }}.jar -d'
    - shell: cmd
    - require:
      - archive: droid-extract

