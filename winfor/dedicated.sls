include:
  - winfor.config
#  - winfor.theme
  - winfor.addon
 
winfor-dedicated:
  test.nop:
    - require:
      - sls: winfor.config
#      - sls: winfor.theme
      - sls: winfor.addon
