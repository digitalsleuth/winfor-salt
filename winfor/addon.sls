include:
  - winfor.set-version
  - winfor.config.user
  - winfor.repos
  - winfor.python3-tools
  - winfor.packages
  - winfor.installers
  - winfor.standalones
  - winfor.cleanup

addon-states:
  test.nop:
    - require:
      - sls: winfor.set-version
      - sls: winfor.config.user
      - sls: winfor.repos
      - sls: winfor.python3-tools
      - sls: winfor.packages
      - sls: winfor.installers
      - sls: winfor.standalones
      - sls: winfor.cleanup
