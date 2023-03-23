# Name: Hex Editor Neo (Free)
# Website: https://www.hhdsoftware.com
# Description: Hex Editor
# Category: Raw Parsers / Decoders
# Author: HHD Software
# License: EULA (https://www.hhdsoftware.com/company/terms-of-use)
# Version: 7.25.03.8473
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.25.03.8473' %}
{% set hash = 'ee8993c8dca986f7c5134ff3c6a1b3424c4cf857a9f8f998196ea6b25796921f' %}

free-hex-editor-neo-download-only:
  file.managed:
    - name: '{{ downloads }}\free-hex-editor-neo.exe'
    - source: https://www.hhdsoftware.com/download/free-hex-editor-neo.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
