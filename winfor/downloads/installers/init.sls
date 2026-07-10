include:
  - winfor.downloads.installers.aid4mail
  - winfor.downloads.installers.casenotes-pro
  - winfor.downloads.installers.cygwin
  - winfor.downloads.installers.data-dump
  - winfor.downloads.installers.dcode
  - winfor.downloads.installers.fastcopy
  - winfor.downloads.installers.hxd
  - winfor.downloads.installers.itunes
  - winfor.downloads.installers.mobaxterm
  - winfor.downloads.installers.msiviewer
  - winfor.downloads.installers.systools-pst-viewer
  - winfor.downloads.installers.vbdecompiler
  - winfor.downloads.installers.windbg
  - winfor.downloads.installers.windows-sandbox
  - winfor.downloads.installers.windows-winget

winfor-downloads-installers-states:
  test.nop:
    - require:
      - sls: winfor.downloads.installers.aid4mail
      - sls: winfor.downloads.installers.casenotes-pro
      - sls: winfor.downloads.installers.cygwin
      - sls: winfor.downloads.installers.data-dump
      - sls: winfor.downloads.installers.dcode
      - sls: winfor.downloads.installers.fastcopy
      - sls: winfor.downloads.installers.hxd
      - sls: winfor.downloads.installers.itunes
      - sls: winfor.downloads.installers.mobaxterm
      - sls: winfor.downloads.installers.msiviewer
      - sls: winfor.downloads.installers.systools-pst-viewer
      - sls: winfor.downloads.installers.vbdecompiler
      - sls: winfor.downloads.installers.windbg
      - sls: winfor.downloads.installers.windows-sandbox
      - sls: winfor.downloads.installers.windows-winget
