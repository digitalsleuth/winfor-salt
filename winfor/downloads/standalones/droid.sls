# Name: DROID
# Website: https://www.nationalarchives.gov.uk/information-management/manage-information/preserving-digital-records/droid/
# Description: File Format Identification Tool
# Category: Raw Parsers / Decoders
# Author: The National Archives
# License: BSD License (https://raw.github.com/digital-preservation/droid/master/license.md)
# Version: 6.9.1
# Notes: Command Line and GUI, this will utilize the GUI by default, updates signature database on install

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.9.1' %}
{% set hash = 'dee55dab25aa8f83bd4d0cc6bb73dfb733f01cfd1e3784c0a5049507aab3bb75' %}

droid-download-only:
  file.managed:
    - name: '{{ downloads }}\droid\droid-binary-{{ version }}-bin-win32-with-jre.zip'
    - source: https://github.com/digital-preservation/droid/releases/download/droid-{{ version }}/droid-binary-{{ version }}-bin-win32-with-jre.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
