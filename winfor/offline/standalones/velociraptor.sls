# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.76.1
# Notes: 

{% set version = '0.76' %}
{% set chg_ver = '0.76.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

velociraptor-offline:
  file.managed:
    - name: '{{ inpath }}\velociraptor\velociraptor.exe'
    - source: '{{ downloads }}\velociraptor\velociraptor-v{{ chg_ver }}-windows-amd64.exe'
    - skip_verify: True
    - makedirs: True
    - force: True

velociraptor-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\velociraptor\velociraptor.exe -OutPath {{ inpath }}\shims\velociraptor.exe'
    - require:
      - sls: winfor.config.shims
