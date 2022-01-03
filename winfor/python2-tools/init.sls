include:
  - winfor.python2-tools.volatility2

winfor-python2-tools:
  test.nop:
    - require:
      - sls: winfor.python2-tools.volatility2
