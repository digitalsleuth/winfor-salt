# Name: BitRecover EML File Viewer
# Website: https://www.bitrecover.com
# Description: EML file viewer
# Category: Email
# Author: BitRecover
# License: EULA - https://www.bitrecover.com/terms.html
# Version: 5.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.0' %}

bitrecover-eml-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\bitrecover-eml-viewer\bitrecover-eml-viewer-{{ version }}.exe'
    - source: 'https://www.bitrecover.com/dl/bitrecover-eml-viewer.exe'
    - source_hash: sha256=2C135C450D49D5805582EC5FF5D5DB3431D20B6F1B28AA7D5816547A235EFC3E
    - makedirs: True
