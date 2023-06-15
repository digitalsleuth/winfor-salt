# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = 'cc925c5997cfcb81d440261ab57c8d7bf5b20ff2753ce98a48cb553fb82ffe0d' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

psdecode-download-only:
  file.managed:
    - name: '{{ downloads }}\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True

