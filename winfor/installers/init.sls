include:
  - winfor.installers.dcode
  - winfor.installers.flare-vm
  - winfor.installers.vscode
  - winfor.installers.mobaxterm
  
winfor-installers:
  test.nop:
    - require:
      - sls: winfor.installers.dcode
      - sls: winfor.installers.flare-vm
      - sls: winfor.installers.vscode
      - sls: winfor.installers.mobaxterm
