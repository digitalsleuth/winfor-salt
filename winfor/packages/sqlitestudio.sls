# Name: SQLiteStudio
# Website: https://sqlitestudio.pl/
# Description: SQLite Database browser, creator, editor
# Category: Databases
# Author: Pawel Salawa
# License: GNU General Public License v3 (https://github.com/pawelsalawa/sqlitestudio/blob/master/LICENSE)
# Version: 3.4.17
# Notes: 

include:
  - winfor.repos

sqlitestudio:
  pkg.installed

sqlitestudio-icon-remove:
  file.absent:
    - name: 'C:\Users\Public\Desktop\SQLiteStudio.lnk'
    - require:
      - pkg: sqlitestudio
