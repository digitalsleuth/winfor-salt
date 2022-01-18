include:
  - winfor.config
#  - winfor.theme
  - winfor.addon
#  - winfor.wsl
 
winfor-dedicated:
  test.nop:
    - require:
      - sls: winfor.config
#      - sls: winfor.theme
      - sls: winfor.addon
#      - sls: winfor.wsl
