# Name: 4n6 Email Forensics
# Website: https://forensiksoft.com
# Description: Email forensics utility
# Category: Email
# Author: 4n6 Software
# License: https://forensiksoft.com/terms/
# Version: 7.6
# Notes:

{% set version = '7.6' %}
{% set pkg = '4n6-email-forensics-'~ version ~'.exe' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set exists = salt['file.file_exists'](downloads + '\\4n6-email-forensics\\' + pkg) %}

{% if exists %}
include:
  - winfor.offline.packages.ms-vcpp-2010-redist-x86

4n6-email-forensics-wizard-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /ALLUSERS /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\4n6-email-forensics\'
    - require:
      - sls: winfor.offline.packages.ms-vcpp-2010-redist-x86
{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
