include:
  - winfor.wsl.wsl
  - winfor.wsl.wsl2-update
 
wsl-states:
  test.nop:
    - require:
      - sls: winfor.wsl.wsl
      - sls: winfor.wsl.wsl2-update
