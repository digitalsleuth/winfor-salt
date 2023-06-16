# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = '2b02d2ee4b4fcd7cb133b0a3cd44b06ee2e1b9a388b21abde0f382cb195dc11f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

psdecode-download-only:
  file.managed:
    - name: '{{ downloads }}\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True

