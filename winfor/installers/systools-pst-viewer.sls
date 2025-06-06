# Name: SysTools Outlook PST Viewer
# Website: https://www.systoolsgroup.com
# Description: Outlook PST file parser
# Category: Email
# Author: SysTools
# License: https://www.systoolsgroup.com/eula.pdf
# Version: 5.0
# Notes: 

{% set hash = '012599f3a3abeca988964dbab47b1c3fb31cfe164d6bf724d406859d785ddab2' %}
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
