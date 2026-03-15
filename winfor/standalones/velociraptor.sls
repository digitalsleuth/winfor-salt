# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.75.6
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.75' %}
{% set chg_ver = '0.75.6' %}
{% set hash = '09e6c312c5003e4326e3f71cb2d06a596826b50a911aabe76925790f95e67c33' %}

include:
  - winfor.config.shims

velociraptor-download:
  file.managed:
    - name: '{{ inpath }}\velociraptor\velociraptor.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ chg_ver }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

velociraptor-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\velociraptor\velociraptor.exe -OutPath {{ inpath }}\shims\velociraptor.exe'
    - require:
      - sls: winfor.config.shims
