vcxsrv:
  pkg.installed

vcxsrv-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\XLaunch.lnk'
    - require:
      - pkg: vcxsrv
