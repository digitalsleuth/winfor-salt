# Name: VB-Decompiler
# Website: https://www.vb-decompiler.org
# Description: Visual Basic Decompiler
# Category: Executables
# Author: DotFix Software
# License: https://www.vb-decompiler.org/license.htm
# Version: 12.8
# Notes: 

{% set version = '12.8' %}
{% set hash = '5d383c8e58951f655a4e099d2c98bb610fc94360e47b27ce54b784f50277ae79' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

vbdecompiler-download-only:
  file.managed:
    - name: '{{ downloads }}\vb-decompiler\vb_decompiler_lite-{{ version }}.zip'
    - source: https://www.vb-decompiler.org/files/vb_decompiler_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
