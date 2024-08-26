# Name: Kernel OST Viewer
# Website: https://www.nucleustechnologies.com                             
# Description: Free Outlook OST viewer     
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 21.1
# Notes: 

include:
  - winfor.repos

kernel-ost-viewer:
  pkg.installed

taskkill-ost-viewer-edge-window:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - pkg: kernel-ost-viewer
