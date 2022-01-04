autopsy:
  pkg.installed:
    - version: '4.19.3'

autopsy-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Autopsy 4.19.3.lnk'
    - require:
      - pkg: autopsy
