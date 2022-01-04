include:
  - winfor.config.debloat-windows
  - winfor.config.computer-name
  - winfor.config.user
  - winfor.config.pdfs
  - winfor.config.del-edge-shortcut

winfor-config:
  test.nop:
    - require:
      - sls: winfor.config.debloat-windows
      - sls: winfor.config.computer-name
      - sls: winfor.config.user
      - sls: winfor.config.pdfs
      - sls: winfor.config.del-edge-shortcut
