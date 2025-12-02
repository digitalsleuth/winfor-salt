include:
  - winfor.config.user
  - winfor.repos
  - winfor.python3-tools
  - winfor.packages
  - winfor.installers
  - winfor.standalones
  - winfor.cleanup

addon-version-file:
  file.managed:
    - name: 'C:\winfor-version'
    - source: salt://winfor/VERSION
    - replace: True
    - require:
      - sls: winfor.config.user
      - sls: winfor.repos
      - sls: winfor.python3-tools
      - sls: winfor.packages
      - sls: winfor.installers
      - sls: winfor.standalones
      - sls: winfor.cleanup
