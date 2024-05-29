# Name: DROID
# Website: https://www.nationalarchives.gov.uk/information-management/manage-information/preserving-digital-records/droid/
# Description: File Format Identification Tool
# Category: Raw Parsers / Decoders
# Author: The National Archives
# License: BSD License (https://raw.github.com/digital-preservation/droid/master/license.md)
# Version: 6.7.0
# Notes: Command Line and GUI, this will utilize the GUI by default, updates signature database on install

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.7.0' %}
{% set hash = '110ee3eb73e587bbfe47e9ed05ad4f03177db6bc2378a6593a8083d729361d9a' %}

droid-download-only:
  file.managed:
    - name: '{{ downloads }}\droid\droid-binary-{{ version }}-bin-win32-with-jre.zip'
    - source: https://github.com/digital-preservation/droid/releases/download/droid-{{ version }}/droid-binary-{{ version }}-bin-win32-with-jre.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
