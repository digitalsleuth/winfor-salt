{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

pestudio-download:
  file.managed:
    - name: 'C:\salt\tempdownload\pestudio.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256=2af46dc7568fed6dfe8feca5fef546f2b2d1be150dbc12022ed78812de0ddc9a
    - makedirs: True

pestudio-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\pestudio.zip'
    - enforce_toplevel: False
    - require:
      - file: pestudio-download

pestudio-env-vars:
  win_path.exists:
    - name: 'C:\standalone\pestudio\'

winfor-standalones-pestudio-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PEStudio.lnk'
    - target: 'C:\standalone\pestudio\pestudio.exe'
    - force: True
    - working_dir: 'C:\standalone\pestudio\'
    - makedirs: True
    - require:
      - file: pestudio-download
      - archive: pestudio-extract
