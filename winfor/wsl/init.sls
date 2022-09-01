include:
  - winfor.wsl.wsl
  - winfor.wsl.wsl2-update
  - winfor.wsl.wsl-config
 
winfor-wsl:
  test.nop:
    - require:
      - sls: winfor.wsl.wsl
      - sls: winfor.wsl.wsl2-update
      - sls: winfor.wsl.wsl-config
