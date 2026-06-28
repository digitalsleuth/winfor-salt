# Name: Portals
# Website: https://portals-app.com
# Description: Desktop Organizer
# Category: Requirements
# Author: Ross Patterson
# License: Free To Use - Terms and Conditions (https://rosspat.dev/privacy/)
# Version: 3.2.1.0
# Notes:

{% set version = '3.2.1.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'portals-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\portals\\' + pkg) %}

{% if exists %}
portals-install-offline:
  cmd.run:
    - name: '{{ pkg }} /ALLUSERS /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\portals\'

portals-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Portals.lnk'
    - require:
      - cmd: portals-install-offline

portals-end-process-offline:
  cmd.run:
    - name: 'taskkill /F /IM "Portals.exe"'
    - bg: True
    - require:
      - cmd: portals-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
