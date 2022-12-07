# Name: Kernel PST Viewer
# Website: https://www.nucleustechnologies.com                             
# Description: Free Outlook PST viewer     
# Category: Email
# Author: Nucleus Technologies
# License: EULA (https://www.nucleustechnologies.com/eula.pdf)
# Version: 20.3
# Notes: 

kernel-pst-viewer:
  pkg.installed

taskkill-pst-viewer-edge-window:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - pkg: kernel-pst-viewer
