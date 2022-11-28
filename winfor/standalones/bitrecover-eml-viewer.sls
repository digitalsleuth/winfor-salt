# Name: BitRecover EML File Viewer
# Website: https://www.bitrecover.com
# Description: EML file viewer
# Category: Email
# Author: BitRecover
# License: EULA - https://www.bitrecover.com/terms.html
# Version: 5.0
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

bitrecover-eml-viewer-download:
  file.managed:
    - name: 'C:\standalone\bitrecover-eml-viewer\bitrecover-eml-viewer.exe'
    - source: 'https://www.bitrecover.com/dl/bitrecover-eml-viewer.exe'
    - source_hash: sha256=2C135C450D49D5805582EC5FF5D5DB3431D20B6F1B28AA7D5816547A235EFC3E
    - makedirs: True

winfor-standalones-bitrecover-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\BitRecover EML Viewer.lnk'
    - target: 'C:\standalone\bitrecover-eml-viewer\bitrecover-eml-viewer.exe'
    - force: True
    - working_dir: 'C:\standalone\bitrecover-eml-viewer\'
    - makedirs: True
    - require:
      - file: bitrecover-eml-viewer-download
