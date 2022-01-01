volatility2-download:
  file.managed:
    - name: 'C:\salt\tempdownload\volatility_2.6_win64_standalone.zip'
    - source: http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_win64_standalone.zip
    - source_hash: sha256=bb021f3b569bf8ee4a408b2e07b0662699894ff7eecd4473badf0ef0c58f2fce
    - makedirs: True

volatility2-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload'
    - source: 'C:\salt\tempdownload\volatility_2.6_win64_standalone.zip'
    - enforce_toplevel: False
    - require:
      - file: volatility2-download

volatility2-folder-move:
  file.rename:
    - name: 'C:\standalone\volatility'
    - source: 'C:\salt\tempdownload\volatility_2.6_win64_standalone\'
    - force: True
    - makedirs: True
    - require:
      - archive: volatility2-extract

volatility2-file-rename:
  file.rename:
    - name: 'C:\standalone\volatility\volatility.exe'
    - source: 'C:\standalone\volatility\volatility_2.6_win64_standalone.exe'
    - force: True
    - makedirs: True
    - require:
      - file: volatility2-folder-move

volatility2-env-vars:
  win_path.exists:
    - name: 'C:\standalone\volatility\'
