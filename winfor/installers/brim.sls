# Name: Brim
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek and Saricata
# Category: Network Forensics
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/brim/blob/main/LICENSE.txt)
# Version: 0.30.0

{% set hash = '33e86bbf67936459a50b3cc1713254b6a4cf817ab46b07d49ffe7658edb84349' %}

brim:
  file.managed:
    - name: 'C:\salt\tempdownload\Brim-Setup-0.30.0.exe'
    - source: https://github.com/brimdata/brim/releases/download/v0.30.0/Brim-Setup-0.30.0.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

brim-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\Brim-Setup-0.30.0.exe -R C:\Brim\ -d -X -l C:\Brim\ -q -O -s https://www.brimdata.io/'
    - shell: cmd
    - success_retcodes: 2
