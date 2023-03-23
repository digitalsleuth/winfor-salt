# Name: regshot
# Website: https://sourceforge.net/projects/regshot/
# Description: Registry snapshot utility to compare snapshots
# Category: Registry
# Author: maddes, regshot, xhmikosr
# License: GNU Lesser General Public License (https://sourceforge.net/p/regshot/code/HEAD/tree/branches/1.9.0/files/license_lgpl-2.1.txt)
# Version: 1.9.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

regshot-download-only:
  file.managed:
    - name: '{{ downloads }}\Regshot-1.9.0.7z'
    - source: https://versaweb.dl.sourceforge.net/project/regshot/regshot/1.9.0/Regshot-1.9.0.7z
    - source_hash: sha256=a92327ffa25f456dff86bae60d42dc8e85e8f3cf987d1d0449d0402a39827d85
    - makedirs: True
