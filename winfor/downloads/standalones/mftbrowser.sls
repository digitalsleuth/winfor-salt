# Name: MFT Browser
# Website: https://github.com/kacos2000/MFT_Browser
# Description: Graphical MFT Browser utility
# Category: Windows Analysis
# Author: Costas K.
# License: MIT License (https://github.com/kacos2000/MFT_Browser/blob/master/LICENSE)
# Version: 1.0.80
# Notes:

{% set version = '1.0.80' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('mftbrowser') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mftbrowser-download-only:
  file.managed:
    - name: '{{ downloads }}\mftbrowser\mftbrowser-{{ version }}.exe'
    - source: https://github.com/kacos2000/MFT_Browser/releases/download/v.{{ version }}/MFTBrowser.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
