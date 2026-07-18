include:
  - winfor.offline.wsl.wsl
 
wsl-states-offline:
  test.nop:
    - require:
      - sls: winfor.offline.wsl.wsl
