include:
  - winfor.config
  - winfor.addon
  - winfor.theme.winfor
 
dedicated-states:
  test.nop:
    - require:
      - sls: winfor.config
      - sls: winfor.addon
      - sls: winfor.theme.winfor
