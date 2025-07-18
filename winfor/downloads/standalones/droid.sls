# Name: DROID
# Website: https://www.nationalarchives.gov.uk/information-management/manage-information/preserving-digital-records/droid/
# Description: File Format Identification Tool
# Category: Raw Parsers / Decoders
# Author: The National Archives
# License: BSD License (https://raw.github.com/digital-preservation/droid/master/license.md)
# Version: 6.9.3
# Notes: Command Line and GUI, this will utilize the GUI by default, updates signature database on install

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.9.3' %}
{% set hash = '43ea56f3573804542967fa5a1ef46f0632ff6c8fc75b35dacacd17c751ed7abb' %}

droid-download-only:
  file.managed:
    - name: '{{ downloads }}\droid\droid-binary-{{ version }}-bin-win64-with-jre.zip'
    - source: https://github.com/digital-preservation/droid/releases/download/{{ version }}/droid-binary-{{ version }}-bin-win64-with-jre.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
