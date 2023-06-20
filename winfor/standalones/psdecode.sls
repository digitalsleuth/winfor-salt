# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = 'a295654010a23dd2c6d1b0aab22c8fc31935854cd8e4c9959e48e1ddcac6ad0f' %}

psdecode-download:
  file.managed:
    - name: 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\PSDecode\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True

