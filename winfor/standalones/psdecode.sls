# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

psdecode-download:
  file.managed:
    - name: 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\PSDecode\PSDecode.psm1'
    - source: https://github.com/R3MRUM/PSDecode/raw/master/PSDecode.psm1
    - source_hash: sha256=709cd4c1cb95d57feddb971040c798dadf6603639a5e010a7787a0d9b846d108
    - makedirs: True

