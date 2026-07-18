include:
  - winfor.downloads.wsl.wsl
 
wsl-states-download-only:
  test.nop:
    - require:
      - sls: winfor.downloads.wsl.wsl
