include:
  - winfor.installers.dcode
  - winfor.installers.mobaxterm
  - winfor.installers.data-dump
  - winfor.installers.hxd
  - winfor.installers.cygwin
  - winfor.installers.windows-sandbox
  - winfor.installers.vbdecompiler
  - winfor.installers.systools-pst-viewer
#  - winfor.installers.magnet-axiom No longer at the provided URL
  - winfor.installers.fastcopy
  - winfor.installers.windows-terminal
  - winfor.installers.windbg
  - winfor.installers.casenotes-pro
  - winfor.installers.msiviewer
  - winfor.installers.aid4mail
  
installer-states:
  test.nop:
    - require:
      - sls: winfor.installers.dcode
      - sls: winfor.installers.mobaxterm
      - sls: winfor.installers.data-dump
      - sls: winfor.installers.hxd
      - sls: winfor.installers.cygwin
      - sls: winfor.installers.windows-sandbox
      - sls: winfor.installers.vbdecompiler
      - sls: winfor.installers.systools-pst-viewer
#      - sls: winfor.installers.magnet-axiom
      - sls: winfor.installers.fastcopy
      - sls: winfor.installers.windows-terminal
      - sls: winfor.installers.windbg
      - sls: winfor.installers.casenotes-pro
      - sls: winfor.installers.msiviewer
      - sls: winfor.installers.aid4mail
