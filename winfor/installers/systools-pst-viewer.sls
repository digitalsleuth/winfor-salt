# Name: SysTools Outlook PST Viewer
# Website: https://www.systoolsgroup.com
# Description: Outlook PST file parser
# Category: Email
# Author: SysTools
# License: https://www.systoolsgroup.com/eula.pdf
# Version: 5.0
# Notes: 

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('systools-pst-viewer') %}
{% set version = '5.0' %}

pst-viewer-download:
  file.managed:
    - name: 'C:\salt\tempdownload\outlook-pst-viewer.exe'
    - source: https://downloads.systoolsgroup.com/outlook-pst-viewer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

pst-viewer-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\outlook-pst-viewer.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd

taskkill-systools-pst-viewer-edge-window:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - cmd: pst-viewer-install
