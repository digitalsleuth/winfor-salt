# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = 'bd2c7f91c5cf1eeef4fd49b997bd6a6428f7d1dcd60a3f0028e6c6462be2a2a8' %}

psdecode-download:
  file.managed:
    - name: 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\PSDecode\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True

