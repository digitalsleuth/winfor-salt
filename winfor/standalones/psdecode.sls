# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = '3ff74ea8e47a337321e3b7e3739a6965d3840bb4a153a30323dbb9132635e95d' %}

psdecode-download:
  file.managed:
    - name: 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\PSDecode\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True

