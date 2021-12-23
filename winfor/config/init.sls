include:
  - winfor.config.computer-name

winfor-config:
  test.nop:
    - require:
      - sls: winfor.config.computer-name
