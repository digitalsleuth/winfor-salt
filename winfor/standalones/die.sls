# Detect It Easy - DIE
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

die-download:
  file.managed:
    - name: 'C:\salt\tempdownload\die_win64_portable_3.03.zip'
    - source: https://github.com/horsicq/DIE-engine/releases/download/3.03/die_win64_portable_3.03.zip
    - source_hash: sha256=f793c8ea4578cafca7543fe407f03ac50ac15850e99983f1cc5ee19b0dda7c78
    - makedirs: True

die-extract:
  archive.extracted:
    - name: 'C:\standalone\die'
    - source: 'C:\salt\tempdownload\die_win64_portable_3.03.zip'
    - enforce_toplevel: False
    - require:
      - file: die-download

die-env-vars:
  win_path.exists:
    - name: 'C:\standalone\die\'

winfor-standalones-die-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DIE.lnk'
    - target: 'C:\standalone\die\die.exe'
    - force: True
    - working_dir: 'C:\standalone\die\'
    - makedirs: True
    - require:
      - file: die-download
      - archive: die-extract
