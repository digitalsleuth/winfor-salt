# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

windows-sandbox:
  dism.feature_installed:
    - name: Containers-DisposableClientVM
    - restart: False
    - enable_parent: True
