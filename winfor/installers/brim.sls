# Name: Brim
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek and Saricata
# Category: Network Forensics
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/brim/blob/main/LICENSE.txt)
# Version: 0.31.0

{% set hash = '49E8B1AD9CA1ACEE832CCB01816277A21271CB9F50B8EBD477C6200A405F5C9B' %}

brim:
  file.managed:
    - name: 'C:\salt\tempdownload\Brim-Setup-0.31.0.exe'
    - source: https://github.com/brimdata/brim/releases/download/v0.31.0/Brim-Setup-0.31.0.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

brim-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\Brim-Setup-0.31.0.exe -R C:\Brim\ -d -X -l C:\Brim\ -q -O -s https://www.brimdata.io/'
    - shell: cmd
    - success_retcodes: 2
