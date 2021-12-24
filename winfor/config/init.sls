include:
  - winfor.config.computer-name
  - winfor.config.user
  - winfor.config.pdfs

winfor-config:
  test.nop:
    - require:
      - sls: winfor.config.computer-name
      - sls: winfor.config.user
      - sls: winfor.config.pdfs
