# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 12.8
# Notes: 

{% set version = '12.8' %}
{% set hash = '163349edab8740d8200da4d49c795144af301cb585892e44099f5edbee7a4707' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

vbdecompiler-download-only:
  file.managed:
    - name: '{{ downloads }}\vb-decompiler\vb_decompiler_lite-{{ version }}.zip'
    - source: https://www.vb-decompiler.org/files/vb_decompiler_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
