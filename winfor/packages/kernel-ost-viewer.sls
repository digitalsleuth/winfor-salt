# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

kernel-ost-viewer:
  pkg.installed

taskkill-ost-viewer-edge-window:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - pkg: kernel-ost-viewer
