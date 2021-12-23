include:
  - winfor.packages.autopsy
  - winfor.packages.firefox
  - winfor.packages.chrome
  - winfor.packages.registry-viewer
  - winfor.packages.httplogbrowser
  - winfor.packages.db-browser-sqlite
  - winfor.packages.bulk-extractor
  - winfor.packages.vs-community
  - winfor.packages.vcxsrv
  
winfor-packages:
  test.nop:
    - require:
      - sls: winfor.packages.autopsy
      - sls: winfor.packages.firefox
      - sls: winfor.packages.chrome
      - sls: winfor.packages.registry-viewer
      - sls: winfor.packages.httplogbrowser
      - sls: winfor.packages.db-browser-sqlite
      - sls: winfor.packages.bulk-extractor
      - sls: winfor.packages.vs-community
      - sls: winfor.packages.vcxsrv
