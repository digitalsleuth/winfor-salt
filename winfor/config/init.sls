include:
  - winfor.config.layout
  - winfor.config.user
  - winfor.config.debloat-windows
  - winfor.config.computer-name
  - winfor.config.pdfs
  - winfor.config.del-edge-shortcut
  - winfor.config.admin-cmd-prompt
  - winfor.config.admin-posh-prompt

winfor-config:
  test.nop:
    - require:
      - sls: winfor.config.layout
      - sls: winfor.config.user
      - sls: winfor.config.debloat-windows
      - sls: winfor.config.computer-name
      - sls: winfor.config.pdfs
      - sls: winfor.config.del-edge-shortcut
      - sls: winfor.config.admin-cmd-prompt
      - sls: winfor.config.admin-posh-prompt
