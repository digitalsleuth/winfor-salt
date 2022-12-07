# Name: Shadow Explorer
# Website: https://www.shadowexplorer.com
# Description: Windows Volume Shadow Copy viewer
# Category: Windows Analysis
# Author: ShadowExplorer
# License: 
# Version: 0.9.462.0
# Notes: 

include:
  - winfor.packages.dotnetfx35

shadowexplorer:
  pkg.installed:
    - require:
      - sls: winfor.packages.dotnetfx35
    - watch:
      - sls: winfor.packages.dotnetfx35
