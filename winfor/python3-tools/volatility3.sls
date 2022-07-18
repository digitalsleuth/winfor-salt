# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

include:
  - winfor.packages.python3
  - winfor.python3-tools.py3-pycryptodome
  - winfor.python3-tools.yara-python

volatility3:
  pip.installed:
    - name: git+https://github.com/volatilityfoundation/volatility3.git
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
      - sls: winfor.python3-tools.py3-pycryptodome
      - sls: winfor.python3-tools.yara-python

volatility3-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\vol3.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\Scripts\vol.exe" %*'
    - require:
      - pip: volatility3

volatility3-shell-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\volshell3.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\Scripts\volshell.exe" %*'
    - require:
      - pip: volatility3

volatility3-symbols-folder:
  file.directory:
    - name: 'C:\Program Files\Python310\Scripts\symbols\'
    - force: True
    - makedirs: True
    - win_inheritance: True
    - require:
      - pip: volatility3

volatility3-windows-symbols-download:
  file.managed:
    - name: 'C:\salt\tempdownload\windows.zip'
    - source: https://downloads.volatilityfoundation.org/volatility3/symbols/windows.zip
    - source_hash: sha256=231d69735b9a5482b16bdbf1ec356e0a95574c44079e68dfb02ebddb34d55f3e
    - makedirs: True

volatility3-windows-symbols-extract:
  archive.extracted:
    - name: 'C:\Program Files\Python310\Scripts\symbols\'
    - source: 'C:\salt\tempdownload\windows.zip'
    - enforce_toplevel: False
    - require:
      - file: volatility3-symbols-folder

volatility3-linux-symbols-download:
  file.managed:
    - name: 'C:\salt\tempdownload\linux.zip'
    - source: https://downloads.volatilityfoundation.org/volatility3/symbols/linux.zip
    - source_hash: sha256=d9d03616858c8247d62921656c1238e54daa7aa024c1b496ec624fd90c6231e2
    - makedirs: True

volatility3-linux-symbols-extract:
  archive.extracted:
    - name: 'C:\Program Files\Python310\Scripts\symbols\'
    - source: 'C:\salt\tempdownload\linux.zip'
    - enforce_toplevel: False
    - require:
      - file: volatility3-symbols-folder

volatility3-mac-symbols-download:
  file.managed:
    - name: 'C:\salt\tempdownload\mac.zip'
    - source: https://downloads.volatilityfoundation.org/volatility3/symbols/mac.zip
    - source_hash: sha256=fd12c8338724b175b0c5765af3313328b700ad53de4a00b4aa50e9a8bcef9129
    - makedirs: True

volatility3-mac-symbols-extract:
  archive.extracted:
    - name: 'C:\Program Files\Python310\Scripts\symbols\'
    - source: 'C:\salt\tempdownload\mac.zip'
    - enforce_toplevel: False
    - require:
      - file: volatility3-symbols-folder
