# Name: Kernel PST Viewer
# Website: https://www.nucleustechnologies.com                             
# Description: Free Outlook PST viewer     
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 20.3
# Notes: 

{% set version = '20.3' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'kernel-pst-viewer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\kernel\\' + pkg) %}

{% if exists %}
kernel-pst-viewer-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\kernel\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
