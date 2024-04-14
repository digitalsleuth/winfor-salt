# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = '8a91d08ce1021ebcf3eb37d342ef222514a11fdaab19fa4fd40c874bf1e2867e' %}
{% set PS_PATHS = salt['environ.get']('PSMODULEPATH') %}

{% for PS_PATH in PS_PATHS.split(";") %}
psdecode-download-{{ PS_PATH }}:
  file.managed:
    - name: '{{ PS_PATH }}\PSDecode\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True
{% endfor %}
