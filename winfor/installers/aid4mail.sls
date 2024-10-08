# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 5.1.8 (https://www.aid4mail.com/support/solutions/articles/aid4mail-5-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set hash = '85def03a8fbfe07777d129324a5b66d664e6e36a7e177ac6c4a385272134b6cc' %}
{% set version = '5.1.8' %}

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
