{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

scdbg-download:
  file.managed:
    - name: 'C:\salt\tempdownload\scdbg.zip'
    - source: http://sandsprite.com/CodeStuff/scdbg.zip
    - source_hash: sha256=e94de9b8031d84ba7980b410b57494ca5ea9957d2bc6f4aee3fa1e341bc43114
    - makedirs: True

scdbg-extract:
  archive.extracted:
    - name: 'C:\standalone\scdbg'
    - source: 'C:\salt\tempdownload\scdbg.zip'
    - enforce_toplevel: False
    - require:
      - file: scdbg-download

scdbg-env-vars:
  win_path.exists:
    - name: 'C:\standalone\scdbg\'

winfor-standalones-scdbg-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SCDBG-GUI.lnk'
    - target: 'C:\standalone\scdbg\gui_launcher.exe'
    - force: True
    - working_dir: 'C:\standalone\scdbg\'
    - makedirs: True
    - require:
      - file: scdbg-download
      - archive: scdbg-extract
