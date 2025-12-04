set-version:
  file.managed:
    - name: 'C:\winfor-version'
    - source: salt://winfor/VERSION
    - replace: True
