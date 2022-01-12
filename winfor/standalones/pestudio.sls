{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

pestudio-download:
  file.managed:
    - name: 'C:\salt\tempdownload\pestudio.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256=60c601d5e9c46474aaab9c0bf70d56cf5ea3d6cadab09208bae22580711332bb
    - makedirs: True

pestudio-extract:
  archive.extracted:
    - name: 'C:\standalone\pestudio'
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
