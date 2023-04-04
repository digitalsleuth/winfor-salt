# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = 'c9c055124fdc1dce8899268b41718e4f21750ce437d90d9b2ff23d0e5573d449' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

psdecode-download-only:
  file.managed:
    - name: '{{ downloads }}\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True

