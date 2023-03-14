# Name: Nuix Evidence Mover
# Website: https://www.nuix.com/nuix-evidence-mover
# Description: File Transfer tool with source and destination hashing
# Category: Utilities
# Author: NUIX
# License: https://www.oracle.com/legal/terms.html
# Version: 6.2.1
# Notes:

nuix-evidence-mover:
  pkg.installed

nuix-evidence-mover-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Nuix Evidence Mover.lnk'
    - watch:
      - pkg: nuix-evidence-mover
    - require:
      - pkg: nuix-evidence-mover
