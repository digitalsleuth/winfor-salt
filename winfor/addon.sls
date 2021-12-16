include:
  - winfor.repos

winfor-addon-version-file:
  file.managed:
    - name: salt://winfor-version
    - source: salt://winfor/VERSION
    - require:
      - sls: winfor.repos
