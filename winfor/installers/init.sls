include:
  - winfor.installers.dcode
  - winfor.installers.vscode
  - winfor.installers.mobaxterm
  - winfor.installers.windows-terminal
  - winfor.installers.data-dump
  - winfor.installers.hxd
  - winfor.installers.cygwin
  - winfor.installers.windows-sandbox
  
winfor-installers:
  test.nop:
    - require:
      - sls: winfor.installers.dcode
      - sls: winfor.installers.vscode
      - sls: winfor.installers.mobaxterm
      - sls: winfor.installers.windows-terminal
      - sls: winfor.installers.data-dump
      - sls: winfor.installers.hxd
      - sls: winfor.installers.cygwin
      - sls: winfor.installers.windows-sandbox
