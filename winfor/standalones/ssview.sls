{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ssview-download:
  file.managed:
    - name: 'C:\salt\tempdownload\SSView.zip'
    - source: http://mitec.cz/Downloads/SSView.zip
    - source_hash: sha256=59b8894889d39e7299d139010cd87c23031667ffa29c543679cd0ba953432d7f
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
