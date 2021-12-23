include:
  - winfor.addon
  - winfor.theme
  - winfor.config
 
winfor-dedicated:
  test.nop:
    - require:
      - sls: winfor.addon
      - sls: winfor.theme
      - sls: winfor.config
