include:
  - winfor.python3-tools.1768-script
  - winfor.python3-tools.aleapp
  - winfor.python3-tools.amcache
  - winfor.python3-tools.analyzemft
  - winfor.python3-tools.bitsparser
  - winfor.python3-tools.bmc-tools
  - winfor.python3-tools.decompyle3
  - winfor.python3-tools.email-header-analyzer
  - winfor.python3-tools.flare-fakenet-ng
  - winfor.python3-tools.ileapp
  - winfor.python3-tools.iptools
  - winfor.python3-tools.maldump
  - winfor.python3-tools.malwoverview
  - winfor.python3-tools.msoffcrypto-crack
  - winfor.python3-tools.msoffcrypto-tool
  - winfor.python3-tools.ms-word-parser
  - winfor.python3-tools.naft
  - winfor.python3-tools.noriben
  - winfor.python3-tools.oledump
  - winfor.python3-tools.olefile
  - winfor.python3-tools.oletools
  - winfor.python3-tools.pcodedmp
  - winfor.python3-tools.pdfid
  - winfor.python3-tools.pdf-parser
  - winfor.python3-tools.peepdf-3
  - winfor.python3-tools.plaso
  - winfor.python3-tools.py3-pycryptodome
  - winfor.python3-tools.pyinstxtractor
  - winfor.python3-tools.pyson4
  - winfor.python3-tools.python-dateutil
  - winfor.python3-tools.python-evtx
  - winfor.python3-tools.rtfdump
  - winfor.python3-tools.stpyv8
  - winfor.python3-tools.time-decode
  - winfor.python3-tools.usbdeviceforensics
  - winfor.python3-tools.usn-journal-parser
  - winfor.python3-tools.vleapp
  - winfor.python3-tools.volatility3
  - winfor.python3-tools.xlmmacrodeobfuscator
  - winfor.python3-tools.yara-python
  - winfor.python3-tools.zircolite

winfor-python3-tools-states:
  test.nop:
    - require:
      - sls: winfor.python3-tools.1768-script
      - sls: winfor.python3-tools.aleapp
      - sls: winfor.python3-tools.amcache
      - sls: winfor.python3-tools.analyzemft
      - sls: winfor.python3-tools.bitsparser
      - sls: winfor.python3-tools.bmc-tools
      - sls: winfor.python3-tools.decompyle3
      - sls: winfor.python3-tools.email-header-analyzer
      - sls: winfor.python3-tools.flare-fakenet-ng
      - sls: winfor.python3-tools.ileapp
      - sls: winfor.python3-tools.iptools
      - sls: winfor.python3-tools.maldump
      - sls: winfor.python3-tools.malwoverview
      - sls: winfor.python3-tools.msoffcrypto-crack
      - sls: winfor.python3-tools.msoffcrypto-tool
      - sls: winfor.python3-tools.ms-word-parser
      - sls: winfor.python3-tools.naft
      - sls: winfor.python3-tools.noriben
      - sls: winfor.python3-tools.oledump
      - sls: winfor.python3-tools.olefile
      - sls: winfor.python3-tools.oletools
      - sls: winfor.python3-tools.pcodedmp
      - sls: winfor.python3-tools.pdfid
      - sls: winfor.python3-tools.pdf-parser
      - sls: winfor.python3-tools.peepdf-3
      - sls: winfor.python3-tools.plaso
      - sls: winfor.python3-tools.py3-pycryptodome
      - sls: winfor.python3-tools.pyinstxtractor
      - sls: winfor.python3-tools.pyson4
      - sls: winfor.python3-tools.python-dateutil
      - sls: winfor.python3-tools.python-evtx
      - sls: winfor.python3-tools.rtfdump
      - sls: winfor.python3-tools.stpyv8
      - sls: winfor.python3-tools.time-decode
      - sls: winfor.python3-tools.usbdeviceforensics
      - sls: winfor.python3-tools.usn-journal-parser
      - sls: winfor.python3-tools.vleapp
      - sls: winfor.python3-tools.volatility3
      - sls: winfor.python3-tools.xlmmacrodeobfuscator
      - sls: winfor.python3-tools.yara-python
      - sls: winfor.python3-tools.zircolite

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
