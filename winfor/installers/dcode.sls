dcode:
  file.managed:
    - name: C:\\salt\\tempdownload\\DCode-x86-EN-5.5.21194.40.zip
    - source: "https://www.digital-detective.net/download/download.php?downcode=ae2znu5994j1lforlh03"
    - source_hash: sha256=dbb23d6ea4f572fbaec017fb8acc2a8b62b74fafa81ea4a388966ec14087a9e4
    - makedirs: True

dcode-archive:
  archive.extracted:
    - name: C:\\salt\\tempdownload\\dcode
    - source: C:\\salt\\tempdownload\\DCode-x86-EN-5.5.21194.40.zip
    - enforce_toplevel: False
    - watch:
      - file: dcode

dcode-install:
  cmd.run:
    - name: "C:\\salt\\tempdownload\\dcode\\DCode-x86-EN-5.5.21194.40.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH"