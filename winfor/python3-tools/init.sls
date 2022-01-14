include:
  - winfor.python3-tools.naft
  - winfor.python3-tools.volatility3
  - winfor.python3-tools.autotimeliner
  - winfor.python3-tools.bitsparser
  - winfor.python3-tools.noriben
  - winfor.python3-tools.usbdeviceforensics
  - winfor.python3-tools.pcodedmp
  - winfor.python3-tools.iptools

winfor-python3-tools:
  test.nop:
    - require:
      - sls: winfor.python3-tools.naft
      - sls: winfor.python3-tools.volatility3
      - sls: winfor.python3-tools.autotimeliner
      - sls: winfor.python3-tools.bitsparser
      - sls: winfor.python3-tools.noriben
      - sls: winfor.python3-tools.usbdeviceforensics
      - sls: winfor.python3-tools.pcodedmp
      - sls: winfor.python3-tools.iptools
