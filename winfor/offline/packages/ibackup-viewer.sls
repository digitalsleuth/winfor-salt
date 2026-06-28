# Name: iBackup Viewer
# Website: https://www.imactools.com
# Description: View iDevice backups on Windows
# Category: Mobile Analysis
# Author: iMacTools
# License: Free (No specific license)
# Version: 4.27.30.0
# Notes: 

{% set version = '4.27.30.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'ibackup-viewer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\ibackup-viewer\\' + pkg) %}

{% if exists %}
ibackup-viewer-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS /NOCLOSEAPPLICATIONS /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\ibackup-viewer\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
