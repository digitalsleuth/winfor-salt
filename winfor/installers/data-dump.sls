{% set version = '1.0.15089.1' %}
{% set hash = '5e80b9efb2abb23c491342708820e673f965f3cf079713e78e799b382db6d652' %}

data-dump:
  file.managed:
    - name: C:\\salt\\tempdownload\\DataDump-x86-EN-{{ version }}.zip
    - source: https://www.digital-detective.net/download/download.php?downcode=w1qsj6b3ru92d4xwm72z
    - source_hash: sha256={{ hash }}
    - makedirs: True

data-dump-extract:
  archive.extracted:
    - name: C:\\salt\\tempdownload\\data-dump
    - source: C:\\salt\\tempdownload\\DataDump-x86-EN-{{ version }}.zip
    - enforce_toplevel: False
    - watch:
      - file: data-dump

data-dump-install:
  cmd.run:
    - name: "C:\\salt\\tempdownload\\data-dump\\DataDump-x86-EN-{{ version }}.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH,!DESKTOPICON"
    - require:
      - file: data-dump
      - archive: data-dump-extract
