vscode:
  file.managed:
    - name: "C:\\salt\\tempdownload\\VSCodeUserSetup-x64-1.63.0.exe"
    - source: "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
    - source_hash: sha256=8F7B7C036F048C14979D51DF86D586849D1163FF3A5C25A51E372465B82A24B6
    - makedirs: True

autopsy_install:
  cmd.run:
    - name: "C:\\salt\\tempdownload\\VSCodeUserSetup-x64-1.63.0.exe /SP- /VERYSILENT /NORESTART /MERGETASKS=!RUNCODE,ADDCONTEXTMENUFILES,ADDCONTEXTMENUFOLDERS,ADDTOPATH"
