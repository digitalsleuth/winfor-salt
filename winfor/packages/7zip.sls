# Name: 7-Zip
# Website: https://7-zip.org
# Description: Zip Compiler and Extractor
# Category: Requirements
# Author: Igor Pavlov
# License: GNU LGPL (https://www.7-zip.org/faq.html)
# Version: 22.00
# Notes: 

7zip:
  pkg.installed

7zip-env-vars:
  win_path.exists:
    - name: 'C:\Program Files\7-Zip'
