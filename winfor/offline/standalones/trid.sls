# Name: TrID
# Website: https://mark0.net/soft-trid-e.html
# Description: File identifier based on their binary signatures
# Category: Executables
# Author: Marco Pontello
# License: Free for personal / non-commercial use
# Version: 2.48
# Notes:

{% set version = '2.48' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set hash = '65d339cc3f758a9d78e41f2c418955dfcd8c4a5152682e8cc9af0f551d169a4b' %}

include:
  - winfor.config.shims

trid-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\trid'
    - source: '{{ downloads }}\trid\trid_win64-{{ version }}.zip'
    - enforce_toplevel: False

trid-install-offline:
  cmd.run:
    - name: 'TrID_setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /MERGETASKS=!RUNCODE,!DESKTOPICON /DIR="{{ inpath }}\trid\"'
    - cwd: '{{ inpath }}\trid'
    - require:
      - archive: trid-extract-offline

trid-defs-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\trid\'
    - source: '{{ downloads }}\trid\triddefs.zip'
    - enforce_toplevel: False

trid-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\trid\trid.exe -OutPath {{ inpath }}\shims\trid.exe'
    - require:
      - sls: winfor.config.shims
