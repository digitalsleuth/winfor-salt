# Name: OfficeMalScanner
# Website: http://www.reconstructer.org/main.html
# Description: Office Document analysis tool to detect implants and malware
# Category: Documents / Editors
# Author: Frank Boldewin
# License: Unknown
# Version: 0.62
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.config.shims

officemalscanner-download:
  file.managed:
    - name: 'C:\salt\tempdownload\OfficeMalScanner.zip'
    - source: salt://winfor/files/OfficeMalScanner.zip
    - source_hash: sha256=d84bb67485ee73f7b1666b39ba01b80e31cf2021b85671dd036858053be65c1e
    - makedirs: True

officemalscanner-extract:
  archive.extracted:
    - name: '{{ inpath }}\officemalscanner'
    - source: 'C:\salt\tempdownload\OfficeMalScanner.zip'
    - enforce_toplevel: False
    - require:
      - file: officemalscanner-download

officemalscanner-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\officemalscanner\officemalscanner.exe -OutPath {{ inpath }}\shims\officemalscanner.exe'
    - require:
      - sls: winfor.config.shims
