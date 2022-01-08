include:
  - winfor.standalones.zimmerman
  - winfor.standalones.sysinternals
  - winfor.standalones.evtx-dump
#  - winfor.standalones.nirsoft
  - winfor.standalones.eventfinder
  - winfor.standalones.regripper
  - winfor.standalones.usb-write-blocker
  - winfor.standalones.ntfs-log-tracker
  - winfor.standalones.logfileparser
  - winfor.standalones.dotpeek
  - winfor.standalones.kape
  - winfor.standalones.sqlitestudio
  - winfor.standalones.autorunner
  - winfor.standalones.sleuthkit
  - winfor.standalones.logparser-studio
  - winfor.standalones.exeinfope
  - winfor.standalones.floss

winfor-standalones:
  test.nop:
    - require:
      - sls: winfor.standalones.zimmerman
      - sls: winfor.standalones.sysinternals
      - sls: winfor.standalones.evtx-dump
#      - sls: winfor.standalones.nirsoft
      - sls: winfor.standalones.eventfinder
      - sls: winfor.standalones.regripper
      - sls: winfor.standalones.usb-write-blocker
      - sls: winfor.standalones.ntfs-log-tracker
      - sls: winfor.standalones.logfileparser
      - sls: winfor.standalones.dotpeek
      - sls: winfor.standalones.kape
      - sls: winfor.standalones.sqlitestudio
      - sls: winfor.standalones.autorunner
      - sls: winfor.standalones.sleuthkit
      - sls: winfor.standalones.logparser-studio
      - sls: winfor.standalones.exeinfope
      - sls: winfor.standalones.floss
