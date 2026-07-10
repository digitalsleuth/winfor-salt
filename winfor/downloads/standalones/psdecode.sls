# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set version = '5.0' %}
{% set hash = '16b18d0a7bd89b5469772bc5e0c5b7b56dc7175e0c0e5d9fbe3539c7bd2a616a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

psdecode-download-only:
  file.managed:
    - name: '{{ downloads }}\psdecode\psdecode-{{ version }}.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True

