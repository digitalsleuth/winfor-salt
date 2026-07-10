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
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'velociraptor-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\velociraptor\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

velociraptor-offline:
  file.managed:
    - name: '{{ inpath }}\velociraptor\velociraptor.exe'
    - source: '{{ downloads }}\velociraptor\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - force: True

velociraptor-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\velociraptor\velociraptor.exe -OutPath {{ inpath }}\shims\velociraptor.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
