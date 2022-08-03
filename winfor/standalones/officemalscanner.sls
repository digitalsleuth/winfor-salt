# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

officemalscanner-download:
  file.managed:
    - name: 'C:\salt\tempdownload\OfficeMalScanner.zip'
    - source: salt://winfor/files/OfficeMalScanner.zip
    - source_hash: sha256=d84bb67485ee73f7b1666b39ba01b80e31cf2021b85671dd036858053be65c1e
    - makedirs: True

officemalscanner-extract:
  archive.extracted:
    - name: 'C:\standalone\officemalscanner'
    - source: 'C:\salt\tempdownload\OfficeMalScanner.zip'
    - enforce_toplevel: False
    - require:
      - file: officemalscanner-download

officemalscanner-env-vars:
  win_path.exists:
    - name: 'C:\standalone\officemalscanner'
