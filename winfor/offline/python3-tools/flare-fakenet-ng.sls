# Name: Fakenet-NG
# Website: https://github.com/mandiant/flare-fakenet-ng
# Description: Next Generation Dynamic Network Analysis Tool
# Category: Network
# Author: https://github.com/mandiant/flare-fakenet-ng/blob/master/AUTHORS
# License: Apache License 2.0 (https://github.com/mandiant/flare-fakenet-ng/blob/master/LICENSE.txt)
# Version: 3.5
# Notes: 

{% set version = '3.5' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

flare-fakenet-ng-rename-folder-offline:
  file.rename:
    - name: '{{ inpath }}\flare-fakenet-ng'
    - source: '{{ downloads }}\flare-fakenet-ng'
    - makedirs: True

flare-fakenet-ng-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\flare-fakenet-ng\fakenet.exe -OutPath {{ inpath }}\shims\fakenet.exe'
    - require:
      - file: flare-fakenet-ng-rename-folder-offline
