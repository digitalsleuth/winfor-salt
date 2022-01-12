{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

bintext-download:
  file.managed:
    - name: 'C:\salt\tempdownload\bintext303.zip'
    - source: http://b2b-download.mcafee.com/products/tools/foundstone/bintext303.zip
    - source_hash: sha256=eb1f2cdd3b8dea931b2fcc13a6ee4c4daad26826fa7db26f9e4f82e7f7b26743
    - makedirs: True

bintext-extract:
  archive.extracted:
    - name: 'C:\standalone\bintext\'
    - source: 'C:\salt\tempdownload\bintext303.zip'
    - enforce_toplevel: False
    - require:
      - file: bintext-download

bintext-env-vars:
  win_path.exists:
    - name: 'C:\standalone\bintext\'

winfor-standalones-bintext-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\BinText.lnk'
    - target: 'C:\standalone\bintext\bintext.exe'
    - force: True
    - working_dir: 'C:\standalone\bintext\'
    - makedirs: True
    - require:
      - archive: bintext-extract
