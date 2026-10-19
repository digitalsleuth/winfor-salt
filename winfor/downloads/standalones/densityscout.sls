# Name: densityscout
# Website: https://cert.at
# Description: Tool to identify entropy within files
# Category: Executables
# Author: Christian Wojner / CERT.at (https://cert.at/en/about-us/overview/)
# License: Internet Software Consortium License (ISCL - https://cert.at/en/downloads/software/software-densityscout)
# Version: Build 45
# Notes:

{% set version = '45' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('densityscout') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

densityscout-download-only:
  file.managed:
    - name: '{{ downloads }}\densityscout\densityscout-{{ version }}.zip'
    - source: https://cert.at/media/files/downloads/software/densityscout/files/densityscout_build_45_windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
