python3_x64:
  pkg.installed:
    - version: '3.10.1150.0'

python3-rename:
  file.rename:
    - name: 'C:\Program Files\Python310\python3.exe'
    - source: 'C:\Program Files\Python310\python.exe'
    - force: True
    - makedirs: True
    - require:
      - pkg: python3_x64

python3-wheel:
  pip.installed:
    - name: wheel
    - bin_env: 'C:\Program Files\Python310\python3.exe'
    - require:
      - pkg: python3_x64
