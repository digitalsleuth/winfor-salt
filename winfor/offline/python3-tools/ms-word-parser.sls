# Name: MS Word Parser
# Website: https://github.com/jjrboucher/MS-Word-Parser
# Description: MS Word document analysis tool
# Category: Documents / Editors
# Author: Jacques Boucher (jjrboucher) / Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/jjrboucher/MS-Word-Parser/blob/master/LICENSE)
# Version: 3.0.1
# Notes:

{% set version = "3.0.1" %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

ms-word-parser-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages ms-word-parser'
    - cwd: '{{ downloads }}\ms-word-parser\'
    - require:
      - sls: winfor.offline.packages.python3

