include:
  - winfor.python3-tools.naft
  - winfor.python3-tools.volatility3
  - winfor.python3-tools.autotimeliner
  - winfor.python3-tools.bitsparser
  - winfor.python3-tools.noriben

winfor-python3-tools:
  test.nop:
    - require:
      - sls: winfor.python3-tools.naft
      - sls: winfor.python3-tools.volatility3
      - sls: winfor.python3-tools.autotimeliner
      - sls: winfor.python3-tools.bitsparser
      - sls: winfor.python3-tools.noriben
