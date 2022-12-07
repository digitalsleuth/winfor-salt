# Name: Autopsy
# Website: https://www.sleuthkit.org
# Description: GUI based application for image analysis
# Category: Acquisition and Analysis
# Author: Brian Carrier / Basis Technology
# License: Apache 2.0 (https://github.com/sleuthkit/autopsy/blob/master/README.txt)
# Version: 4.19.3
# Notes: 

autopsy:
  pkg.installed:
    - version: '4.19.3'

autopsy-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Autopsy 4.19.3.lnk'
    - require:
      - pkg: autopsy
