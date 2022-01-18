{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ssview-download:
  file.managed:
    - name: 'C:\salt\tempdownload\SSView.zip'
    - source: http://mitec.cz/Downloads/SSView.zip
    - source_hash: sha256=8ceb003a88ed985b772accb81551577ce363f268fe14ef23ec47f912b1abe111
    - makedirs: True

ssview-extract:
  archive.extracted:
    - name: 'C:\standalone\ssview'
    - source: 'C:\salt\tempdownload\SSView.zip'
    - enforce_toplevel: False
    - require:
      - file: ssview-download

winfor-standalones-ssview-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SSView.lnk'
    - target: 'C:\standalone\ssview\ssview.exe'
    - force: True
    - working_dir: 'C:\standalone\ssview\'
    - makedirs: True
    - require:
      - file: ssview-download
      - archive: ssview-extract
