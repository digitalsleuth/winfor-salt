include:
  - winfor.packages.firefox
  - winfor.packages.chrome
  
winfor-packages:
  test.nop:
    - require:
      - sls: winfor.packages.firefox
      - sls: winfor.packages.chrome
