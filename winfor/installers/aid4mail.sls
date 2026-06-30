# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 6.3 (https://www.aid4mail.com/support/solutions/articles/aid4mail-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '6.3' %}
{% set hash = '5be9219d044e2fe664e838d759868219b7b1e399dfa8e6ab3791a5870709a251' %}

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
