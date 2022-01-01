python2_x64:
  pkg.installed

python2-rename:
  file.rename:
    - name: 'C:\Python27\python2.exe'
    - source: 'C:\Python27\python.exe'
    - force: True
    - makedirs: True
    - require:
      - pkg: python2_x64

python2-pip:
  cmd.run:
    - name: 'C:\Python27\python2.exe -m ensurepip'
    - shell: cmd
    - require:
      - file: python2-rename

python2-env-vars:
  win_path.exists:
    - names:
      - 'C:\Python27\'
      - 'C:\Python27\Scripts'

