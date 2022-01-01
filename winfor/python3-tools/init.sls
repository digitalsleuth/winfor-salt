include:
  - winfor.python3-tools.naft

winfor-python3-tools:
  test.nop:
    - require:
      - sls: winfor.python3-tools.naft
