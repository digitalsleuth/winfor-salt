# Name: DROID
# Website: https://www.nationalarchives.gov.uk/information-management/manage-information/preserving-digital-records/droid/
# Description: File Format Identification Tool
# Category: Raw Parsers / Decoders
# Author: The National Archives
# License: BSD License (https://raw.github.com/digital-preservation/droid/master/license.md)
# Version: 6.9.12
# Notes: Command Line and GUI, this will utilize the GUI by default, updates signature database on install

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.9.12' %}
{% set hash = 'd89e38cbddab1ec6676cbe565387b78821b2d285446fb668f86b9c9107c7eac0' %}

droid-download-only:
  file.managed:
    - name: '{{ downloads }}\droid\droid-binary-{{ version }}-bin-win64-with-jre.zip'
    - source: https://github.com/digital-preservation/droid/releases/download/{{ version }}/droid-binary-{{ version }}-bin-win64-with-jre.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
