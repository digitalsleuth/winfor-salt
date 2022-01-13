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
  - winfor.standalones.kansa
  - winfor.standalones.logviewer2
  - winfor.standalones.officemalscanner
  - winfor.standalones.pestudio
  - winfor.standalones.cutter
  - winfor.standalones.regshot
  - winfor.standalones.scylla
  - winfor.standalones.srum-dump2
  - winfor.standalones.ssview
  - winfor.standalones.setdllcharacteristics

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
      - sls: winfor.standalones.kansa
      - sls: winfor.standalones.logviewer2
      - sls: winfor.standalones.officemalscanner
      - sls: winfor.standalones.pestudio
      - sls: winfor.standalones.cutter
      - sls: winfor.standalones.regshot
      - sls: winfor.standalones.scylla
      - sls: winfor.standalones.srum-dump2
      - sls: winfor.standalones.ssview
      - sls: winfor.standalones.setdllcharacteristics
