include:
  - winfor.offline.installers.aid4mail
  - winfor.offline.installers.casenotes-pro
  - winfor.offline.installers.cygwin
  - winfor.offline.installers.data-dump
  - winfor.offline.installers.dcode
  - winfor.offline.installers.fastcopy
  - winfor.offline.installers.hxd
  - winfor.offline.installers.init
  - winfor.offline.installers.mobaxterm
  - winfor.offline.installers.msiviewer
  - winfor.offline.installers.systools-pst-viewer
  - winfor.offline.installers.vbdecompiler
  - winfor.offline.installers.windbg
  - winfor.offline.installers.windows-sandbox
  - winfor.offline.installers.windows-winget

offline-installers-states:
  test.nop:
    - require:
      - sls: winfor.offline.installers.aid4mail
      - sls: winfor.offline.installers.casenotes-pro
      - sls: winfor.offline.installers.cygwin
      - sls: winfor.offline.installers.data-dump
      - sls: winfor.offline.installers.dcode
      - sls: winfor.offline.installers.fastcopy
      - sls: winfor.offline.installers.hxd
      - sls: winfor.offline.installers.init
      - sls: winfor.offline.installers.mobaxterm
      - sls: winfor.offline.installers.msiviewer
      - sls: winfor.offline.installers.systools-pst-viewer
      - sls: winfor.offline.installers.vbdecompiler
      - sls: winfor.offline.installers.windbg
      - sls: winfor.offline.installers.windows-sandbox
      - sls: winfor.offline.installers.windows-winget
