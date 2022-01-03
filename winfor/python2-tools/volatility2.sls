include:
  - winfor.python2-tools.pycrypto
  - winfor.python2-tools.distorm3

volatility:
  pip.installed:
    - name: https://github.com/volatilityfoundation/volatility
    - bin_env: 'C:\Python27\python2.exe'
    - require:
      - sls: winfor.python2-tools.pycrypto
      - sls: winfor.python2-tools.distorm3

volatility2-wrapper:
  file.managed:
    - name: 'C:\Python27\Scripts\vol2.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - python2.exe C:\Python27\Scripts\vol.py %1 %*
