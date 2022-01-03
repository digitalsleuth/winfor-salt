include:
  - winfor.packages.python3

volatility3:
  pip.installed:
    - name: git+https://github.com/volatilityfoundation/volatility3.git
    - bin_env: 'C:\Program Files\Python310\python3.exe'
    - require:
      - sls: winfor.packages.python3

volatility3-rename-1:
  file.rename:
    - name: 'C:\Program Files\Python310\Scripts\vol3.exe'
    - source: 'C:\Program Files\Python310\Scripts\vol.exe'
    - force: True
    - makedirs: True
    - require:
      - pip: volatility3

volatility3-rename-2:
  file.rename:
    - name: 'C:\Program Files\Python310\Scripts\vol3shell.exe'
    - source: 'C:\Program Files\Python310\Scripts\volshell.exe'
    - force: True
    - makedirs: True
    - require:
      - pip: volatility3

volatility3-rename-3:
  file.rename:
    - name: 'C:\Program Files\Python310\Scripts\vol3-script.py'
    - source: 'C:\Program Files\Python310\Scripts\vol-script.py'
    - force: True
    - makedirs: True
    - require:
      - pip: volatility3

volatility3-rename-4:
  file.rename:
    - name: 'C:\Program Files\Python310\Scripts\vol3shell-script.py'
    - source: 'C:\Program Files\Python310\Scripts\volshell-script.py'
    - force: True
    - makedirs: True
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
