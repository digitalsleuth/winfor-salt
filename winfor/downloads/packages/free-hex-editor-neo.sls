# Name: Hex Editor Neo (Free)
# Website: https://www.hhdsoftware.com
# Description: Hex Editor
# Category: Raw Parsers / Decoders
# Author: HHD Software
# License: EULA (https://www.hhdsoftware.com/company/terms-of-use)
# Version: 8.21.00.9493
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '8.21.00.9493' %}
{% set hash = '490061fa3eb3600e6692a86eaebfafd56cf9e0fc1f7ce1fe646711a7f9e0c9fb' %}

free-hex-editor-neo-download-only:
  file.managed:
    - name: '{{ downloads }}\free-hex-editor-neo\free-hex-editor-neo-{{ version }}.exe'
    - source: https://www.hhdsoftware.com/download/free-hex-editor-neo.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
