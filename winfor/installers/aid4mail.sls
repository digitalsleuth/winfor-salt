# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 5.1.4 build 889
# Notes: Free Trial / Limited Free Conversion

{% set hash = 'df599c5a421c663952f80cd27c0635d27c82b83b493e42e172f158806cc9c83e' %}
{% set version = '5.1.4' %}

aid4mail-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Aid4Mail5_Setup.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail5_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

aid4mail-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\'
    - source: 'C:\salt\tempdownload\Aid4Mail5_Setup.zip'
    - enforce_toplevel: False
    - require:
      - file: aid4mail-download

aid4mail-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\Aid4Mail5_Setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - require:
      - archive: aid4mail-extract
