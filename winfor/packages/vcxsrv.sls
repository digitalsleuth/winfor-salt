# Name: VcXsrv Windows X Server
# Website: https://sourceforge.net/projects/vcxsrv
# Description: Windows X-Server for interacting with X-Windows environments
# Category: Utilities
# Author: Marha
# License: GNU General Public License v3 (https://sourceforge.net/p/vcxsrv/code/ci/master/tree/COPYING)
# Version: 21.1.16.1
# Notes: 

include:
  - winfor.repos

vcxsrv:
  pkg.installed

vcxsrv-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\XLaunch.lnk'
    - require:
      - pkg: vcxsrv
