include:
  - winfor.installers.dcode
  - winfor.installers.vscode
  - winfor.installers.mobaxterm
#  - winfor.installers.windows-terminal Only installs for current user, not winfor_user
  - winfor.installers.data-dump
  - winfor.installers.hxd
  - winfor.installers.cygwin
  - winfor.installers.windows-sandbox
  - winfor.installers.redline
#  - winfor.installers.windbg - Troubles with source
  - winfor.installers.vbdecompiler
  - winfor.installers.systools-pst-viewer
  - winfor.installers.irfanview-plugins
  
winfor-installers:
  test.nop:
    - require:
      - sls: winfor.installers.dcode
      - sls: winfor.installers.vscode
      - sls: winfor.installers.mobaxterm
#      - sls: winfor.installers.windows-terminal
      - sls: winfor.installers.data-dump
      - sls: winfor.installers.hxd
      - sls: winfor.installers.cygwin
      - sls: winfor.installers.windows-sandbox
      - sls: winfor.installers.redline
#      - sls: winfor.installers.windbg
      - sls: winfor.installers.vbdecompiler
      - sls: winfor.installers.systools-pst-viewer
      - sls: winfor.installers.irfanview-plugins
