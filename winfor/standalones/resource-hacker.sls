# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

resource-hacker-download:
  file.managed:
    - name: 'C:\salt\tempdownload\reshacker_setup.exe'
    - source: http://www.angusj.com/resourcehacker/reshacker_setup.exe
    - source_hash: sha256=080e97f7c198aeeac2a172f055c09d8da365b59b58bf6a71bde4486d9992ff66
    - makedirs: True

resource-hacker-setup:
  cmd.run:
    - name: 'C:\salt\tempdownload\reshacker_setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
