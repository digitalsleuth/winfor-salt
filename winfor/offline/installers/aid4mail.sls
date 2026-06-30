# Name: Aid4Mail
# Website: https://www.aid4mail.com
# Description: Email conversion and analysis
# Category: Email
# Author: Fookes Software Ltd
# License: Copyright (https://www.aid4mail.com/terms)
# Version: 6.3 (https://www.aid4mail.com/support/solutions/articles/aid4mail-version-history)
# Notes: Free Trial / Limited Free Conversion

{% set version = '6.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'aid4mail-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\aid4mail\\' + pkg) %}

{% if exists %}
aid4mail-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\aid4mail\'
    - source: '{{ downloads }}\aid4mail\{{ pkg }}'
    - enforce_toplevel: False

aid4mail-install-offline:
  cmd.run:
    - name: '{{ downloads }}\aid4mail\Aid4Mail6_Setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - require:
      - archive: aid4mail-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

