# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set hash = 'd831eb5b56d3cf08cc0a9d11e05850717521eac7c3daceac2c3664c6aba5e360' %}
{% set PS_PATHS = salt['environ.get']('PSMODULEPATH') %}

{% for PS_PATH in PS_PATHS.split(";") %}
psdecode-download-{{ PS_PATH }}:
  file.managed:
    - name: '{{ PS_PATH }}\PSDecode\PSDecode.psm1'
    - source: https://github.com/CybercentreCanada/assemblyline-service-overpower/raw/main/tools/PSDecode.psm1
    - source_hash: sha256={{ hash }}
    - makedirs: True
{% endfor %}
