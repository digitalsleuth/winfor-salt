# Name: Kernel EDB Viewer
# Website: https://www.nucleustechnologies.com
# Description: Free Exchange EDB viewer
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 25.0
# Notes: 

{% set version = '25.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'kernel-edb-viewer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\kernel\\' + pkg) %}

{% if exists %}
kernel-edb-viewer-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\kernel\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
