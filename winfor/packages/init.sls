include:
  - winfor.packages.autopsy
  - winfor.packages.firefox
  - winfor.packages.chrome
  - winfor.packages.registry-viewer
  
winfor-packages:
  test.nop:
    - require:
      - sls: winfor.packages.autopsy
      - sls: winfor.packages.firefox
      - sls: winfor.packages.chrome
      - sls: winfor.packages.registry-viewer
