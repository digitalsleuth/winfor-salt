include:
  - winfor.packages.python3

winfor-python3-naft:
  pip.installed:
    - name: git+https://github.com/digitalsleuth/naft
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
