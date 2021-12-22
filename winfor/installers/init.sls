include:
  - winfor.installers.dcode
  - winfor.installers.flare-vm
  - winfor.installers.vscode
  - winfor.installers.mobaxterm
  - winfor.installers.windows-terminal
  - winfor.installers.wsl
  - winfor.installers.wsl-config
  
winfor-installers:
  test.nop:
    - require:
      - sls: winfor.installers.dcode
      - sls: winfor.installers.flare-vm
      - sls: winfor.installers.vscode
      - sls: winfor.installers.mobaxterm
      - sls: winfor.installers.windows-terminal
      - sls: winfor.installers.wsl
      - sls: winfor.installers.wsl-config
