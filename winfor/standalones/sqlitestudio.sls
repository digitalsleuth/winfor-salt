{% set version = '3.3.3' %}
{% set hash = 'da888b08b075c71999002b903757d7842746925d8092c00efbd11fc594192494' %}

sqlitestudio-download:
  file.managed:
    - name: 'C:\\salt\\tempdownload\\sqlitestudio-{{ version }}.zip'
    - source: 'https://github.com/pawelsalawa/sqlitestudio/releases/download/{{ version }}/sqlitestudio-{{ version }}.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True

sqlitestudio-extract:
  archive.extracted:
    - name: 'C:\\standalone\\'
    - source: 'C:\\salt\\tempdownload\\sqlitestudio-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: sqlitestudio-download

sqlitestudio-env-vars:
  win_path.exists:
    - name: 'C:\standalone\SQLitestudio'
