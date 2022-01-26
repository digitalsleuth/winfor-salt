include:
  - winfor.packages.vcforpython27

pycryptodome:
  pip.installed:
    - bin_env: 'C:\Python27\python.exe'
    - require:
      - sls: winfor.packages.vcforpython27
