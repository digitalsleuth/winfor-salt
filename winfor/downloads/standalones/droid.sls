# Name: DROID
# Website: https://www.nationalarchives.gov.uk/information-management/manage-information/preserving-digital-records/droid/
# Description: File Format Identification Tool
# Category: Raw Parsers / Decoders
# Author: The National Archives
# License: BSD License (https://raw.github.com/digital-preservation/droid/master/license.md)
# Version: 6.9.14
# Notes: Command Line and GUI, this will utilize the GUI by default, updates signature database on install

{% set version = '6.9.14' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '6e5d3368202ab3409c2e42b4402196db109ce3a2c5883f6c5d04e32ff1523b26' %}

droid-download-only:
  file.managed:
    - name: '{{ downloads }}\droid\droid-{{ version }}.zip'
    - source: https://github.com/digital-preservation/droid/releases/download/{{ version }}/droid-binary-{{ version }}-bin-win64-with-jre.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
