# Name: oletools
# Website: http://www.decalage.info/python/oletools
# Description: Package of tools to analyze MS OLE2 files
# Category: Documents / Editors
# Author: Philippe Lagadec
# License: https://github.com/decalage2/oletools/blob/master/LICENSE.md
# Version: 0.60.2
# Notes: 

{% set version = '0.60.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

oletools-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages oletools'
    - cwd: '{{ downloads }}\oletools\'
    - require:
      - sls: winfor.offline.packages.python3
