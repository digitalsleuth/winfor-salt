# Name: Redline
# Website: https://www.fireeye.com
# Description: Memory and File analysis tool
# Category: Raw Parsers / Decoders
# Author: FireEye
# License: Software Royalty-Free License (https://www.trellix.com/en-us/downloads/free-tools/terms-of-use.html)
# Version: 2.0
# Notes: 

redline-download:
  file.managed:
    - name: 'C:\salt\tempdownload\sdl-redline.zip'
    - source: https://www.fireeye.com/content/dam/fireeye-www/services/freeware/sdl-redline.zip
    - source_hash: sha256=c9b9668a08cdd27d95f236d969194768ef17fa257195758c54a4b502a0f60d4f
    - makedirs: True

redline-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\'
    - source: 'C:\salt\tempdownload\sdl-redline.zip'
    - enforce_toplevel: False
    - require:
      - file: redline-download

redline-install:
  cmd.run:
    - name: 'msiexec /i C:\salt\tempdownload\Redline-2.0.msi /qn /norestart'
    - shell: cmd
