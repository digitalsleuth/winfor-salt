include:
  - winfor.downloads.installers
  - winfor.downloads.packages
  - winfor.downloads.python3-tools
  - winfor.downloads.standalones

download-states:
  test.nop:
    - require:
      - sls: winfor.downloads.installers
      - sls: winfor.downloads.packages
      - sls: winfor.downloads.python3-tools
      - sls: winfor.downloads.standalones
