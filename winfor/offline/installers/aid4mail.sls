# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 6.2 (https://www.aid4mail.com/support/solutions/articles/aid4mail-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '6.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

aid4mail-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\aid4mail\'
    - source: '{{ downloads }}\aid4mail\Aid4Mail6_Setup-{{ version }}.zip'
    - enforce_toplevel: False

aid4mail-install-offline:
  cmd.run:
    - name: '{{ downloads }}\aid4mail\Aid4Mail6_Setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - require:
      - archive: aid4mail-extract-offline
