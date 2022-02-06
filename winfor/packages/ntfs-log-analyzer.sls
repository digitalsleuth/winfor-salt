# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

include:
  - winfor.installers.dotnetfx35

ntfs-log-analyzer:
  pkg.installed:
    - require:
      - sls: winfor.installers.dotnetfx35
