include:
  - winfor.packages.python3

usbdeviceforensics:
  pip.installed:
    - name: 'git+https://github.com/digitalsleuth/usbdeviceforensics.git'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
