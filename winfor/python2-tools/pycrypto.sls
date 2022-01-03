include:
  - winfor.packages.vcforpython27

pycrypto:
  pip.installed:
    - bin_env: 'C:\Python27\python2.exe'
    - require:
      - sls: winfor.packages.vcforpython27
