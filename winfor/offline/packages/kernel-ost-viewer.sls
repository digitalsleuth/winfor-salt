# Name: Kernel OST Viewer
# Website: https://www.nucleustechnologies.com                             
# Description: Free Outlook OST viewer     
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 21.1
# Notes: 

{% set version = '21.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'kernel-ost-viewer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\kernel\\' + pkg) %}

{% if exists %}
kernel-ost-viewer-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\kernel\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
