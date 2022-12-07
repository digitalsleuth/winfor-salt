# Name: usbdeviceforensics
# Website: https://github.com/digitalsleuth/usbdeviceforensics
# Description: Track a USB device throughout a Windows system
# Category: Windows Analysis
# Author: Corey Forman / Mark Woan
# License: Public Domain
# Version: 1.0.0
# Notes: 

include:
  - winfor.packages.python3

usbdeviceforensics:
  pip.installed:
    - name: 'git+https://github.com/digitalsleuth/usbdeviceforensics.git'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
