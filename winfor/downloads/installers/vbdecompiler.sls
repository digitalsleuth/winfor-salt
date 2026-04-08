# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 26.2
# Notes: 

{% set version = '26.2' %}
{% set hash = 'b632a3ac0b74b60c9b57d43b10c3f86d9d8a6eb156896e9bf299af61232d9917' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

vbdecompiler-download-only:
  file.managed:
    - name: '{{ downloads }}\vb-decompiler\vb_decompiler_lite-{{ version }}.zip'
    - source: https://www.vb-decompiler.org/files/vb_decompiler_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
