{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

malcat-download:
  file.managed:
    - name: 'C:\salt\tempdownload\malcat_win64_lite.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256=bb8d41af8b374eb760ad52de039c8b23652796f13769dd0e3dd4a58355b2ff7a
    - makedirs: True

malcat-extract:
  archive.extracted:
    - name: 'C:\standalone\malcat'
    - source: 'C:\salt\tempdownload\malcat_win64_lite.zip'
    - enforce_toplevel: False
    - require:
      - file: malcat-download

malcat-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MalCat.lnk'
    - target: 'C:\standalone\malcat\bin\malcat.exe'
    - force: True
    - working_dir: 'C:\standalone\malcat\bin\'
    - makedirs: True
    - require:
      - file: malcat-download
      - archive: malcat-extract
