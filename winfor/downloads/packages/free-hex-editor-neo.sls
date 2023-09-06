# Name: Hex Editor Neo (Free)
# Website: https://www.hhdsoftware.com
# Description: Hex Editor
# Category: Raw Parsers / Decoders
# Author: HHD Software
# License: EULA (https://www.hhdsoftware.com/company/terms-of-use)
# Version: 7.37.00.8578
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.37.00.8578' %}
{% set hash = '87949cb4ba705968c975ee42421bfb671aae3f481fe0017b10a08e7e722bcd2a' %}

free-hex-editor-neo-download-only:
  file.managed:
    - name: '{{ downloads }}\free-hex-editor-neo.exe'
    - source: https://www.hhdsoftware.com/download/free-hex-editor-neo.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
