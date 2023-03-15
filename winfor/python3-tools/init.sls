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
  - winfor.python3-tools.wleapp
  - winfor.python3-tools.aleapp
  - winfor.python3-tools.ileapp
  - winfor.python3-tools.vleapp
  - winfor.python3-tools.time-decode
#  - winfor.python3-tools.decompyle3 - Doesn't support Py 3.10 yet
  - winfor.python3-tools.amcache
  - winfor.python3-tools.bmc-tools
  - winfor.python3-tools.usn-journal-parser
  - winfor.python3-tools.pdf-parser

python3-tools-states:
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
      - sls: winfor.python3-tools.wleapp
      - sls: winfor.python3-tools.aleapp
      - sls: winfor.python3-tools.ileapp
      - sls: winfor.python3-tools.vleapp
      - sls: winfor.python3-tools.time-decode
#      - sls: winfor.python3-tools.decompyle3 - Doesn't support Py 3.10 yet
      - sls: winfor.python3-tools.amcache
      - sls: winfor.python3-tools.bmc-tools
      - sls: winfor.python3-tools.usn-journal-parser
      - sls: winfor.python3-tools.pdf-parser

python3-filetype-association:
  cmd.run:
    - name: 'ftype Python.File="C:\Windows\py.exe" %L %*'
    - shell: cmd

python3-pathext:
  cmd.run:
    - names:
      - setx /M PATHEXT "%PATHEXT:;.PY;.PYW=%"
      - setx /M PATHEXT "%PATHEXT%;.PY;.PYW"
    - shell: cmd
