# Name: TrID
# Website: https://mark0.net/soft-trid-e.html
# Description: File identifier based on their binary signatures
# Category: Executables
# Author: Marco Pontello
# License: Free for personal / non-commercial use
# Version: 2.48
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.48' %}
{% set hash = '65d339cc3f758a9d78e41f2c418955dfcd8c4a5152682e8cc9af0f551d169a4b' %}

include:
  - winfor.config.shims

trid-download:
  file.managed:
    - name: 'C:\salt\tempdownload\trid_win64.zip'
    - source: https://mark0.net/download/trid_win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

trid-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\trid'
    - source: 'C:\salt\tempdownload\trid_win64.zip'
    - enforce_toplevel: False
    - require:
      - file: trid-download

trid-install:
  cmd.run:
    - name: 'TrID_setup.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /MERGETASKS=!RUNCODE,!DESKTOPICON /DIR="{{ inpath }}\trid\"'
    - cwd: 'C:\salt\tempdownload\trid'
    - require:
      - archive: trid-extract

trid-update:
  cmd.run:
    - name: 'trid.exe -u'
    - cwd: '{{ inpath }}\trid\'
    - require:
      - cmd: trid-install

trid-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\trid\trid.exe -OutPath {{ inpath }}\shims\trid.exe'
    - require:
      - sls: winfor.config.shims
