include:
  - winfor.python2-tools.pycrypto
  - winfor.python2-tools.distorm3

volatility:
  pip.installed:
    - name: git+https://github.com/volatilityfoundation/volatility
    - bin_env: 'C:\Python27\python.exe'
    - require:
      - sls: winfor.python2-tools.pycrypto
      - sls: winfor.python2-tools.distorm3

volatility2-wrapper:
  file.managed:
    - name: 'C:\Python27\Scripts\vol2.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - py -2 C:\Python27\Scripts\vol.py %*

volatility2-env-vars:
  win_path.exists:
    - name: 'C:\Python27\Scripts\'
