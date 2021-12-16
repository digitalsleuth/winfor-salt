include:
  - winfor.addon
 
winfor-dedicated:
  test.nop:
    - require:
      - sls: winfor.addon
