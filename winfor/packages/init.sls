include:
  - winfor.packages.7zip
  - winfor.packages.git
  - winfor.packages.autopsy
  - winfor.packages.firefox
  - winfor.packages.chrome
  - winfor.packages.registry-viewer
  - winfor.packages.httplogbrowser
  - winfor.packages.db-browser-sqlite
  - winfor.packages.bulk-extractor
  - winfor.packages.vs-community
  - winfor.packages.vcxsrv
  - winfor.packages.cygwin
  - winfor.packages.libreoffice
  - winfor.packages.npp
  - winfor.packages.adobereader-dc-classic
  
winfor-packages:
  test.nop:
    - require:
      - sls: winfor.packages.7zip
      - sls: winfor.packages.git
      - sls: winfor.packages.autopsy
      - sls: winfor.packages.firefox
      - sls: winfor.packages.chrome
      - sls: winfor.packages.registry-viewer
      - sls: winfor.packages.httplogbrowser
      - sls: winfor.packages.db-browser-sqlite
      - sls: winfor.packages.bulk-extractor
      - sls: winfor.packages.vs-community
      - sls: winfor.packages.vcxsrv
      - sls: winfor.packages.cygwin
      - sls: winfor.packages.libreoffice
      - sls: winfor.packages.npp
      - sls: winfor.packages.adobereader-dc-classic
