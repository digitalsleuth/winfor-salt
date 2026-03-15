# Name: TrID
# Website: https://mark0.net/soft-trid-e.html
# Description: File identifier based on their binary signatures
# Category: Executables
# Author: Marco Pontello
# License: Free for personal / non-commercial use
# Version: 2.47
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.47' %}
{% set hash = '5683d49089d6f08312ad0736f47f212fbedd4a92af700eab34ee4b242e6060c3' %}

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
