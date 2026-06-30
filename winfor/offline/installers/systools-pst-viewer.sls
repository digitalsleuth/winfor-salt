# Name: SysTools Outlook PST Viewer
# Website: https://www.systoolsgroup.com
# Description: Outlook PST file parser
# Category: Email
# Author: SysTools
# License: https://www.systoolsgroup.com/eula.pdf
# Version: 5.0
# Notes: 

{% set version = '5.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'outlook-pst-viewer-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\outlook-pst-viewer\\' + pkg) %}

{% if exists %}

outlook-pst-viewer-install-offline:
  cmd.run:
    - name: '{{ pkg }} /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\outlook-pst-viewer\'

taskkill-outlook-pst-viewer-edge-window-offline:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - cmd: outlook-pst-viewer-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
