# Name: 4n6 Email Forensics
# Website: https://forensiksoft.com
# Description: Email forensics utility
# Category: Email
# Author: 4n6 Software
# License: https://forensiksoft.com/terms/
# Version: 7.6
# Notes:

{% set version = '7.6' %}
{% set pkg = 'setup-email-forensics-wizard-'~ version ~'.exe' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

4n6-email-forensics-wizard-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /ALLUSERS /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\4n6-email-forensics\'

