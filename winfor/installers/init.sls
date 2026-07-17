include:
  - winfor.installers.aid4mail
  - winfor.installers.casenotes-pro
  - winfor.installers.cygwin
  - winfor.installers.data-dump
  - winfor.installers.dcode
  - winfor.installers.fastcopy
  - winfor.installers.hxd
  - winfor.installers.itunes
  - winfor.installers.mobaxterm
  - winfor.installers.msiviewer
  - winfor.installers.systools-pst-viewer
  - winfor.installers.vbdecompiler
  - winfor.installers.windbg
  - winfor.installers.windows-sandbox
  - winfor.installers.windows-winget

winfor-installers-states:
  test.nop:
    - require:
      - sls: winfor.installers.aid4mail
      - sls: winfor.installers.casenotes-pro
      - sls: winfor.installers.cygwin
      - sls: winfor.installers.data-dump
      - sls: winfor.installers.dcode
      - sls: winfor.installers.fastcopy
      - sls: winfor.installers.hxd
      - sls: winfor.installers.itunes
      - sls: winfor.installers.mobaxterm
      - sls: winfor.installers.msiviewer
      - sls: winfor.installers.systools-pst-viewer
      - sls: winfor.installers.vbdecompiler
      - sls: winfor.installers.windbg
      - sls: winfor.installers.windows-sandbox
      - sls: winfor.installers.windows-winget
