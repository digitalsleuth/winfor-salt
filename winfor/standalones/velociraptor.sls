# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.77.1
# Notes: 

{% set version = '0.77.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'c91cf8a32731c4c45c148393bc7d2af688c392194a9fffc4535e8b583260d55e' %}

include:
  - winfor.config.shims

velociraptor-download:
  file.managed:
    - name: '{{ inpath }}\velociraptor\velociraptor.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ version }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

velociraptor-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\velociraptor\velociraptor.exe -OutPath {{ inpath }}\shims\velociraptor.exe'
    - require:
      - sls: winfor.config.shims
