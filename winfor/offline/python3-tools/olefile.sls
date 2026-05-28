# Name: olefile
# Website: https://www.decalage.info/python/olefileio
# Description: Python module to read / write MS OLE2 files
# Category: Documents / Editors
# Author: Philippe Lagadec
# License: https://github.com/decalage2/olefile/blob/master/LICENSE.txt
# Version: 0.47
# Notes: 

{% set version = '0.47' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

olefile-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages olefile'
    - cwd: '{{ downloads }}\olefile\'
    - require:
      - sls: winfor.offline.packages.python3

