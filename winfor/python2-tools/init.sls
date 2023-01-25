include:
  - winfor.python2-tools.volatility2
  - winfor.python2-tools.flare-fakenet-ng

python2-tools-states:
  test.nop:
    - require:
      - sls: winfor.python2-tools.volatility2
      - sls: winfor.python2-tools.flare-fakenet-ng
