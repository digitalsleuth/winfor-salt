python3_x64:
  pkg.installed:
    - version: '3.10.1150.0'

python3-wheel:
  pip.installed:
    - name: wheel
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - pkg: python3_x64

