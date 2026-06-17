# Name: maldump
# Website: https://github.com/NUKIB/maldump
# Description: Python 3 tool for extracting quarantined files from a live system or mounted image
# Category: Executables
# Author: Czech Republic National Cyber and Information Security Agency
# License: https://github.com/NUKIB/maldump/blob/main/LICENSE
# Version: 0.5.0
# Notes: 

{% set version = '0.5.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

maldump-requirements-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages maldump'
    - cwd: '{{ downloads }}\maldump\'
    - require:
      - sls: winfor.offline.packages.python3

