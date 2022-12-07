# Name: HxD 
# Website: https://mh-nexus.de
# Description: Hex Editor
# Category: Raw Parsers / Decoders
# Author: Mael Horz
# License: https://mh-nexus.de/en/about.php
# Version: 2.5.0.0
# Notes:

{% set version = '2.5.0.0' %}
{% set hash = '5065041c7b03c24b9533a5b32b33db58f2b4924cd84bed41834ff2db51c1cb7c' %}

hxd-download:
  file.managed:
    - name: C:\\salt\\tempdownload\\HxDSetup.zip
    - source: https://mh-nexus.de/downloads/HxDSetup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

hxd-extract:
  archive.extracted:
    - name: C:\\salt\\tempdownload\\
    - source: C:\\salt\\tempdownload\\HxDSetup.zip
    - enforce_toplevel: False
    - require:
      - file: hxd-download

hxd-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\HxDSetup.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH'
    - shell: cmd
    - require:
      - archive: hxd-extract
