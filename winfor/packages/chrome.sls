chrome:
  pkg.installed

chrome-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Google Chrome.lnk'
    - require:
      - pkg: chrome
