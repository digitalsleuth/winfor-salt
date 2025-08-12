# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 6.1.3 (https://www.aid4mail.com/support/solutions/articles/aid4mail-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set hash = 'a7c63abb94ca036d4fad4630ddb6651b66ca3e0291e50d639bcdc666fd89beb2' %}
{% set version = '6.1.3' %}

aid4mail-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Aid4Mail6_Setup.zip'
    - source: https://www.aid4mail.com/download/Aid4Mail6_Setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

aid4mail-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\'
    - source: 'C:\salt\tempdownload\Aid4Mail6_Setup.zip'
    - enforce_toplevel: False
    - require:
      - file: aid4mail-download

aid4mail-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\Aid4Mail6_Setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - require:
      - archive: aid4mail-extract
