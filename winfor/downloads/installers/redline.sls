# Name: Redline
# Website: https://www.fireeye.com
# Description: Memory and File analysis tool
# Category: Raw Parsers / Decoders
# Author: FireEye
# License: Software Royalty-Free License (https://www.trellix.com/en-us/downloads/free-tools/terms-of-use.html)
# Version: 2.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

redline-download-only:
  file.managed:
    - name: '{{ downloads }}\sdl-redline.zip'
    - source: https://www.fireeye.com/content/dam/fireeye-www/services/freeware/sdl-redline.zip
    - source_hash: sha256=c9b9668a08cdd27d95f236d969194768ef17fa257195758c54a4b502a0f60d4f
    - makedirs: True
