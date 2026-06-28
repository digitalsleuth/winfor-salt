# Name: Cyotek WebCopy
# Website: https://www.cyotek.com/cyotek-webcopy
# Description: Website Copier
# Category: Network
# Author: Cyotek Ltd
# License: End User License Agreement (https://docs.cyotek.com/cyowcopy/current/licenseagreement.html)
# Version: 1.9.1.872
# Notes: Automatically launches after install. Unfortunately this cannot be avoided.

include:
  - winfor.repos

webcopy:
  pkg.installed

webcopy-close-application:
  cmd.run:
    - name: 'taskkill /F /IM "cyowcopy.exe"'
    - bg: True
    - require:
      - pkg: webcopy
    - watch:
      - pkg: webcopy
