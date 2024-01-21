# Name: Hex Editor Neo (Free)
# Website: https://www.hhdsoftware.com
# Description: Hex Editor
# Category: Raw Parsers / Decoders
# Author: HHD Software
# License: EULA (https://www.hhdsoftware.com/company/terms-of-use)
# Version: 7.41.00.8634
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.41.00.8634' %}
{% set hash = 'a7f9da4f6c80b700a1af9a85f063f601dc698a464b616aca5d429ca9608aa1dd' %}

free-hex-editor-neo-download-only:
  file.managed:
    - name: '{{ downloads }}\free-hex-editor-neo\free-hex-editor-neo-{{ version }}.exe'
    - source: https://www.hhdsoftware.com/download/free-hex-editor-neo.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
