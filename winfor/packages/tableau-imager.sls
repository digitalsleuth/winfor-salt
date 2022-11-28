# Name: Tableau Imager
# Website: https://opentext.com
# Description: Disk / Device Imager
# Category: Acquisition and Analysis
# Author: OpenText
# License: EULA
# Version: 20.3.3
# Notes:

tableau-imager:
  pkg.installed

tableau-imager-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Tableau Imager.lnk'
    - require:
      - pkg: tableau-imager
