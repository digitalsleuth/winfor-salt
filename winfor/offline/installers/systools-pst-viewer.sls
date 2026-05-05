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

pst-viewer-install-offline:
  cmd.run:
    - name: '{{ downloads }}\outlook-pst-viewer\outlook-pst-viewer-{{ version }}.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd

taskkill-systools-pst-viewer-edge-window-offline:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - cmd: pst-viewer-install-offline
