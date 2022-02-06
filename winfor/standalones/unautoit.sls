# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

unautoit-download:
  file.managed:
    - name: 'C:\standalone\unautoit\unautoit.exe'
    - source: https://github.com/x0r19x91/UnAutoIt/releases/download/v1.1.1/UnAutoIt-windows-amd64.exe
    - source_hash: sha256=020b06f1f2921c5e630c3eba0b98d02a6c151445a1cc637f082dc2e08d8eb536
    - makedirs: True

unautoit-env-vars:
  win_path.exists:
    - name: 'C:\standalone\unautoit\'
    - require:
      - file: unautoit-download
