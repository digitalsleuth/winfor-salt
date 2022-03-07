include:
  - winfor.config
  - winfor.addon
  - winfor.config.layout
  - winfor.theme
 
winfor-dedicated:
  test.nop:
    - require:
      - sls: winfor.config
      - sls: winfor.addon
      - sls: winfor.config.layout
      - sls: winfor.theme
