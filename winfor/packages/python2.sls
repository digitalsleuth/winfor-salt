python2_x64:
  pkg.installed

python2-env-vars:
  win_path.exists:
    - name: 'C:\Python27\Scripts\'
