# Name: UnAutoIt
# Website: https://github.com/digitalsleuth/UnAutoIt
# Description: AutoIt extractor
# Category: Installers
# Author: Corey Forman (digitalsleuth) / x0r19x91
# License: GNU General Public License v3 (https://github.com/digitalsleuth/UnAutoIt/blob/main/LICENSE)
# Version: 1.1.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
include:
  - winfor.config.shims

unautoit-download:
  file.managed:
    - name: '{{ inpath }}\unautoit\unautoit.exe'
    - source: https://github.com/digitalsleuth/UnAutoIt/releases/download/v1.1.1/UnAutoIt-windows-amd64.exe
    - source_hash: sha256=d771f7adc7882cf23a387434fbd0ab1902c0326df6035b2a239ebcbd256b52e9
    - makedirs: True

unautoit-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\unautoit\unautoit.exe -OutPath {{ inpath }}\shims\unautoit.exe'
    - require:
      - sls: winfor.config.shims
