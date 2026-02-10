# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 26
# Notes: 

{% set version = '26' %}
{% set hash = 'bb28549b996b0333b83cd4b49586b12bbdb1261633377a0575caf794e5e27348' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

vbdecompiler-download-only:
  file.managed:
    - name: '{{ downloads }}\vb-decompiler\vb_decompiler_lite-{{ version }}.zip'
    - source: https://www.vb-decompiler.org/files/vb_decompiler_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
