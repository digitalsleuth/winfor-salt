# Name: setdllcharacteristics
# Website: https://blog.didierstevens.com/2010/10/17/setdllcharacteristics/
# Description: Manually edit the characteristics of DLL's 
# Category: Executables
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.0.1
# Notes: 

setdll-download:
  file.managed:
    - name: 'C:\salt\tempdownload\setdllcharacteristics_v0_0_0_1.zip'
    - source: http://didierstevens.com/files/software/setdllcharacteristics_v0_0_0_1.zip
    - source_hash: sha256=5a9d3815f317c7c0ff7737f271ce0c60be2cb0f4168c5ea5ad8cef84ad718577
    - makedirs: True

setdll-extract:
  archive.extracted:
    - name: 'C:\standalone\setdll'
    - source: 'C:\salt\tempdownload\setdllcharacteristics_v0_0_0_1.zip'
    - enforce_toplevel: False
    - require:
      - file: setdll-download

setdll-env-vars:
  win_path.exists:
    - name: 'C:\standalone\setdll\'
