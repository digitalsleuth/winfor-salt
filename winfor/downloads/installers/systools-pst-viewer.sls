# Name: SysTools Outlook PST Viewer
# Website: https://www.systoolsgroup.com
# Description: Outlook PST file parser
# Category: Email
# Author: SysTools
# License: https://www.systoolsgroup.com/eula.pdf
# Version: 5.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pst-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\outlook-pst-viewer.exe'
    - source: https://downloads.systoolsgroup.com/outlook-pst-viewer.exe
    - source_hash: sha256=012599f3a3abeca988964dbab47b1c3fb31cfe164d6bf724d406859d785ddab2
    - makedirs: True
