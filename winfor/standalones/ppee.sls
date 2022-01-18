{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ppee-download:
  file.managed:
    - name: 'C:\salt\tempdownload\PPEE(puppy)_1.12.zip'
    - source: 'https://www.mzrst.com/puppy/PPEE(puppy)%201.12.zip'
    - source_hash: sha256=9ee99220fe876527aaeec93d9b2c944e64d9c3c9d18ac3e3a52afd4a7392da88
    - makedirs: True

ppee-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\PPEE(puppy)_1.12.zip'
    - enforce_toplevel: False
    - require:
      - file: ppee-download

ppee-folder-rename:
  file.rename:
    - name: 'C:\standalone\ppee'
    - source: 'C:\standalone\PPEE(puppy) 1.12\'
    - force: True
    - makedirs: True
    - require:
      - archive: ppee-extract

winfor-standalones-ppee-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PPEE.lnk'
    - target: 'C:\standalone\ppee\PPEE.exe'
    - force: True
    - working_dir: 'C:\standalone\ppee\'
    - makedirs: True
    - require:
      - file: ppee-download
      - archive: ppee-extract
