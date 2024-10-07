include:
  - winfor.config.user
  - winfor.repos
  - winfor.packages
  - winfor.installers
  - winfor.standalones
  - winfor.python3-tools
  - winfor.cleanup

addon-version-file:
  file.managed:
    - name: 'C:\winfor-version'
    - source: salt://winfor/VERSION
    - replace: True
    - require:
      - sls: winfor.config.user
      - sls: winfor.repos
      - sls: winfor.packages
      - sls: winfor.installers
      - sls: winfor.standalones
      - sls: winfor.python3-tools
      - sls: winfor.cleanup
