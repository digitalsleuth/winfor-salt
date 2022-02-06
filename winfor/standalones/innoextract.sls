# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

innoextract-download:
  file.managed:
    - name: 'C:\salt\tempdownload\innoextract-1.9-windows.zip'
    - source: https://constexpr.org/innoextract/files/innoextract-1.9-windows.zip
    - source_hash: sha256=6989342c9b026a00a72a38f23b62a8e6a22cc5de69805cf47d68ac2fec993065
    - makedirs: True

innoextract-extract:
  archive.extracted:
    - name: 'C:\standalone\innoextract'
    - source: 'C:\salt\tempdownload\innoextract-1.9-windows.zip'
    - enforce_toplevel: False
    - require:
      - file: innoextract-download

innoextract-env-vars:
  win_path.exists:
    - name: 'C:\standalone\innoextract\'
