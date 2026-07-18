include:
  - winfor.offline.installers
  - winfor.offline.packages
  - winfor.offline.python3-tools
  - winfor.offline.standalones
  - winfor.offline.wsl

offline-states:
  test.nop:
    - require:
      - sls: winfor.offline.installers
      - sls: winfor.offline.packages
      - sls: winfor.offline.python3-tools
      - sls: winfor.offline.standalones
      - sls: winfor.offline.wsl
