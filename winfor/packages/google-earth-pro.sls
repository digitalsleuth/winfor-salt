# Name: Google Earth Pro
# Website: https://www.google.com/earth/about/versions/?gl=CA&hl=en#download-pro
# Description: Tool for viewing Google Maps through installed application
# Category: Utilities
# Author: Google
# License: Terms of Service (https://www.google.com/help/terms_maps/)
# Version: 7.3.4.8642
# Notes:

google-earth-pro:
  pkg.installed

remove-google-earth-icon:
  file.absent:
    - names:
      - 'C:\Users\Public\Public Desktop\Google Earth Pro.lnk'
      - 'C:\Users\Public\Desktop\Google Earth Pro.lnk'
    - require:
      - pkg: google-earth-pro
