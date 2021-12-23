include:
  - winfor.standalones.zimmerman
  - winfor.standalones.sysinternals
  - winfor.standalones.evtx_dump
  - winfor.standalones.nirsoft
  - winfor.standalones.eventfinder
  - winfor.standalones.regripper
  - winfor.standalones.usb-write-blocker

winfor-standalones:
  test.nop:
    - require:
      - sls: winfor.standalones.zimmerman
      - sls: winfor.standalones.sysinternals
      - sls: winfor.standalones.evtx_dump
      - sls: winfor.standalones.nirsoft
      - sls: winfor.standalones.eventfinder
      - sls: winfor.standalones.regripper
      - sls: winfor.standalones.usb-write-blocker
