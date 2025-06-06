# Name: iTunes-Backup-Explorer
# Website: https://github.com/MaxiHuHe04/iTunes-Backup-Explorer
# Description: Java-based tool to explore iTunes backups
# Category: Mobile Analysis
# Author: Maxi Herczegh
# License: MIT License (https://github.com/MaxiHuHe04/iTunes-Backup-Explorer/blob/master/LICENSE | 3RD-PARTY-LICENSES.txt)
# Version: 1.7
# Notes: MSI install comes with everything required in 1.7+

{% set version = '1.7' %}

include:
  - winfor.repos

itunes-backup-explorer:
  pkg.installed

itunes-backup-explorer-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\iTunes Backup Explorer.lnk'
    - require:
      - pkg: itunes-backup-explorer
