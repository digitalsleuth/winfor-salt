# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

vssmount-download:
  file.managed:
    - name: 'C:\standalone\vssmount.cmd'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/vssmount.cmd
    - source_hash: sha256=a9fde04ce05e1f53ecc4464126a102ca8283b04039dee320b6c3f15001938933
    - makedirs: True
