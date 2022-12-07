# Name: VcXsrv Windows X Server
# Website: https://sourceforge.net/projects/vcxsrv
# Description: Windows X-Server for interacting with X-Windows environments
# Category: Utilities
# Author: Marha
# License: GNU General Public License v3 (https://sourceforge.net/p/vcxsrv/code/ci/master/tree/COPYING)
# Version: 1.20.14.0
# Notes: 

vcxsrv:
  pkg.installed

vcxsrv-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\XLaunch.lnk'
    - require:
      - pkg: vcxsrv
