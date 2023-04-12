include:
  - winfor.python2-tools.volatility2

python2-tools-states:
  test.nop:
    - require:
      - sls: winfor.python2-tools.volatility2
