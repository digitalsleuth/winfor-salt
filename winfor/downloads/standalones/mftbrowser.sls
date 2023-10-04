# Name: MFT Browser
# Website: https://github.com/kacos2000/MFT_Browser
# Description: Graphical MFT Browser utility
# Category: Windows Analysis
# Author: Costas K.
# License: MIT License (https://github.com/kacos2000/MFT_Browser/blob/master/LICENSE)
# Version: 1.0.72.0
# Notes:

{% set version = '1.0.72.0' %}
{% set hash = '65c36420e2db2f3d4a068bc905f6b788c9376736b183c94e9893cb00a5d53119' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mftbrowser-download-only:
  file.managed:
    - name: '{{ downloads }}\MFTBrowser.exe'
    - source: https://github.com/kacos2000/MFT_Browser/releases/download/v.{{ version }}/MFTBrowser.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
