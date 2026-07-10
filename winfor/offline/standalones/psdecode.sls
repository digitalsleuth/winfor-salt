# Name: PSDecode
# Website: https://github.com/CyberCentreCanada/assemblyline-service-overpower
# Description: Powershell script to deobfuscate encoded Powershell scripts
# Category: Executables
# Author: R3MRUM / CyberCentreCanada
# License: 
# Version: 5.0
# Notes: 

{% set version = '5.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set hash = '16b18d0a7bd89b5469772bc5e0c5b7b56dc7175e0c0e5d9fbe3539c7bd2a616a' %}
{% set PS_PATHS = salt['environ.get']('PSMODULEPATH') %}
{% set pkg = 'psdecode-'~ version ~'.psm1' %}
{% set exists = salt['file.file_exists'](downloads + '\\psdecode\\' + pkg) %}

{% if exists %}

{% for PS_PATH in PS_PATHS.split(";") %}
psdecode-copy-{{ PS_PATH }}-offline:
  file.copy:
    - name: '{{ PS_PATH }}\PSDecode\PSDecode.psm1'
    - source: '{{ downloads }}\psdecode\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - force: True
{% endfor %}

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
