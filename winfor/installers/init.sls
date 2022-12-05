include:
  - winfor.installers.Brim
  - winfor.installers.dcode
  - winfor.installers.vscode
  - winfor.installers.mobaxterm
  - winfor.installers.data-dump
  - winfor.installers.hxd
  - winfor.installers.cygwin
  - winfor.installers.windows-sandbox
  - sls: winfor.installers.pst-walker
  - winfor.installers.redline
  - winfor.installers.vbdecompiler
  - winfor.installers.systools-pst-viewer
  - winfor.installers.irfanview-plugins
  - winfor.installers.magnet-axiom
  - winfor.installers.nuix-evidence-mover
  - winfor.installers.fastcopy
  
winfor-installers:
  test.nop:
    - require:
      - winfor.installers.Brim
      - sls: winfor.installers.dcode
      - sls: winfor.installers.vscode
      - sls: winfor.installers.mobaxterm
      - sls: winfor.installers.data-dump
      - sls: winfor.installers.hxd
      - sls: winfor.installers.cygwin
      - sls: winfor.installers.windows-sandbox
      - sls: winfor.installers.pst-walker
      - sls: winfor.installers.redline
      - sls: winfor.installers.vbdecompiler
      - sls: winfor.installers.systools-pst-viewer
      - sls: winfor.installers.irfanview-plugins
      - sls: winfor.installers.magnet-axiom
      - sls: winfor.installers.nuix-evidence-mover
      - sls: winfor.installers.fastcopy
