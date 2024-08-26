include:
  - winfor.config
  - winfor.theme.computer-name
  - winfor.theme.winfor.debloat-windows
  - winfor.addon
  - winfor.theme.winfor
  - winfor.cleanup
 
dedicated-states:
  test.nop:
    - require:
      - sls: winfor.config
      - sls: winfor.theme.computer-name
      - sls: winfor.theme.winfor.debloat-windows
      - sls: winfor.addon
      - sls: winfor.theme.winfor
      - sls: winfor.cleanup
