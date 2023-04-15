# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 12.1
# Notes: 

{% set version = '12.1' %}
{% set hash = '4da66532b7a2c16f80b7f3b79a65fbde176041ab27325f3afa0e9222d17d4d08' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

vbdecompiler-download-only:
  file.managed:
    - name: '{{ downloads }}\vb_decompiler_lite.zip'
    - source: https://www.vb-decompiler.org/files/vb_decompiler_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
