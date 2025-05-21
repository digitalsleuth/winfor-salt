# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = 'a693ce0da760c91fad126d8422f5736e4bae39340b3b4e75223a7c6617696a64' %}
{% set PS_PATHS = salt['environ.get']('PSMODULEPATH') %}

{% for PS_PATH in PS_PATHS.split(";") %}
psdecode-download-{{ PS_PATH }}:
  file.managed:
    - name: '{{ PS_PATH }}\PSDecode\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True
{% endfor %}
