include:
  - winfor.python3-tools.naft
  - winfor.python3-tools.volatility3
  - winfor.python3-tools.autotimeliner
  - winfor.python3-tools.bitsparser
  - winfor.python3-tools.noriben
  - winfor.python3-tools.usbdeviceforensics
  - winfor.python3-tools.pcodedmp
  - winfor.python3-tools.iptools
  - winfor.python3-tools.pyinstxtractor
  - winfor.python3-tools.oledump
  - winfor.python3-tools.rtfdump
  - winfor.python3-tools.msoffcrypto-crack
  - winfor.python3-tools.xlmmacrodeobfuscator
  - winfor.python3-tools.oletools
  - winfor.python3-tools.pdfid
#  - winfor.python3-tools.decompyle3 - Doesn't support Py 3.10 yet

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
      - sls: winfor.python3-tools.pyinstxtractor
      - sls: winfor.python3-tools.oledump
      - sls: winfor.python3-tools.rtfdump
      - sls: winfor.python3-tools.msoffcrypto-crack
      - sls: winfor.python3-tools.xlmmacrodeobfuscator
      - sls: winfor.python3-tools.oletools
      - sls: winfor.python3-tools.pdfid
#      - sls: winfor.python3-tools.decompyle3 - Doesn't support Py 3.10 yet
