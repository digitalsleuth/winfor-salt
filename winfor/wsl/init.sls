include:
  - winfor.wsl.wsl
 
wsl-states:
  test.nop:
    - require:
      - sls: winfor.wsl.wsl
