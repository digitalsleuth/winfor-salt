# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

# https://download.microsoft.com/download/0/8/c/08c19fa4-4c4f-4ffb-9d6c-150906578c9e/NetFx20SP1_x86.exe
dotnetfx35:
  dism.feature_installed:
    - name: NetFx3
    - restart: False
    - enable_parent: True
