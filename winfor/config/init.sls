include:
  - winfor.config.user
  - winfor.config.pdfs
  - winfor.config.del-edge-shortcut
  - winfor.config.admin-cmd-prompt
  - winfor.config.admin-posh-prompt
  - winfor.config.copy-as-path

config-states:
  test.nop:
    - require:
      - sls: winfor.config.user
      - sls: winfor.config.pdfs
      - sls: winfor.config.del-edge-shortcut
      - sls: winfor.config.admin-cmd-prompt
      - sls: winfor.config.admin-posh-prompt
      - sls: winfor.config.copy-as-path
