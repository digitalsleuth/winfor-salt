python2_x64:
  pkg.installed

python2-alias:
  cmd.run:
    - name: 'reg add "HKLM\Software\Microsoft\Command Processor" /v Autorun /d "doskey python2=C:\Python27\python.exe" /f'
    - shell: cmd
