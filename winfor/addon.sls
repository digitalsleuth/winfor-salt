include:
  - winfor.repos
  - winfor.packages
  - winfor.installers
  - winfor.standalones

winfor-addon-version-file:
  file.managed:
    - name: salt://winfor-version
    - source: salt://winfor/VERSION
    - require:
      - sls: winfor.repos
      - sls: winfor.packages
      - sls: winfor.installers
      - sls: winfor.standalones

