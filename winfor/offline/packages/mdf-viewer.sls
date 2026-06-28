# Name: SysTools SQL MDF Viewer
# Website: https://www.systoolsgroup.com
# Description: SQL MDF analysis tool
# Category: Databases
# Author: SysTools
# License: EULA (https://www.systoolsgroup.com/eula.html)
# Version: 13.0
# Notes: 

{% set version = '13.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'mdf-viewer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\systools\\' + pkg) %}

{% if exists %}
mdf-viewer-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\systools\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
